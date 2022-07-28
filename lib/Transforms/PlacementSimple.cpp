//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;
using namespace xilinx::AIE;

namespace {
struct PlacementSimple : public polyaie::PlacementSimpleBase<PlacementSimple> {
  PlacementSimple() = default;
  PlacementSimple(const PolyAIEOptions &opts) {
    col_pos = opts.placementcol;
    row_pos = opts.placementrow;
  }
  void runOnOperation() override;

};
} // namespace

std::vector<int> vect{ 2,  3,  6,  7,  10, 11, 18, 19,26, 27, 34, 35, 42, 43, 46, 47 };


void getMatrixsize(dataflow::FuncOp func,float &A,float &B,float &C) {
  // Create alloc for all arguments of the top function.
  auto arg = func.getArgument(0); 
  auto type = arg.getType().dyn_cast<MemRefType>();
  A=std::ceil(type.getDimSize(0)/32);
  C=std::ceil(type.getDimSize(1)/32);
  auto arg1 = func.getArgument(1) ;
  auto type1 = arg1.getType().dyn_cast<MemRefType>();
  B=std::ceil(type1.getDimSize(1)/32);
}

void find_tile(std::vector<int> &io_type, int Tile_number, float middle_pos){
  float distance=1000000.0;
  for (int i=0; i < 16-Tile_number+1; i++){
     std::vector<int> tile_set;
     tile_set.clear();
     for (int k=i; k<i+Tile_number; k++){
        tile_set.push_back(vect.at(k));
     } 
       
     float temp_distance = 0;
     for (int j=0; j < Tile_number; j++){
         temp_distance += pow((tile_set.at(j) - middle_pos),2);
     }
     if(temp_distance<distance){
       distance=temp_distance;
       io_type.clear();
       for (int n=0; n<Tile_number; n++) {
          io_type.push_back(tile_set.at(n));
       }  
     }
  }
}

void PlacementSimple::runOnOperation() {
    auto mod = getOperation();
    auto b = OpBuilder(mod);
    auto loc = b.getUnknownLoc();
    auto topFunc = getTopFunc<dataflow::FuncOp>(mod);

    // Count the number of port that is broadcasted
    llvm::SmallDenseMap<Value, int, 16> LHS_bro_cnt;
    llvm::SmallDenseMap<Value, int, 16> RHS_bro_cnt;
    int LHS_cnt = 0, RHS_cnt = 0;

    int col_postion=col_pos;
    int row_postion=row_pos;
    float A,B,C; 
    getMatrixsize(topFunc,A,B,C);

    float LHS_reuse = C;
    float RHS_reuse = 2.0;

    int Port_in =
        A * std::ceil((float)(C / LHS_reuse)) * std::ceil((float)(B / 4.0)) +
        C * std::ceil((float)(A / RHS_reuse)) * std::ceil((float)(B / 4.0));
    int Port_out = std::ceil((float)(A*C/4.0));
    int Tile_in = std::ceil((float)(Port_in/2.0));
    int Tile_out = std::ceil((float)(Port_out/2.0));
    float middle_pos = (float)((2*col_pos + A * C-1)/2.0);
    int current_port_in=0;
    int current_chan_in=0;

    std::vector<int> io_in;
    std::vector<int> io_out;

    //Count the input/output port distance to the center of the AIE array
    // and choose the nearest set
    find_tile(io_in,Tile_in,middle_pos);
    find_tile(io_out,Tile_out,middle_pos);
    
    //First round
    //Place the AIE tiles in a recutangular placement form
    for (auto process : topFunc.getOps<ProcessOp>()) {
      
      //Process if no placement attached
      if(!(process->getAttr("polyaie.col"))){

        //Detect the chain (tiles with true dependency)
        auto accumOperand = process->getOperand(2);
  
        // The start of the chain has the accumulator defined by TensorLoadOp
        if (auto tensorOp=accumOperand.getDefiningOp<dataflow::TensorLoadOp>()){
        
          //For the start accumulator assign an invalid channel (This part can be modified)
          tensorOp->setAttr("polyaie.col", b.getI64IntegerAttr(0));
          tensorOp->setAttr("polyaie.row",b.getI64IntegerAttr(0));
          tensorOp->setAttr("polyaie.channel",b.getI64IntegerAttr(2));

          //Assign AIEs in a recutangular placement form 
          row_postion=row_pos;
          process->setAttr("polyaie.col",b.getI64IntegerAttr(col_postion));
          process->setAttr("polyaie.row",b.getI64IntegerAttr(row_postion));

          //Assign the AIEs and GMIOs for all the operand in the chain
          auto result=process.getResult(0);
          int end_chain=0;
          while(!end_chain){
            end_chain=1;
            for (auto process_child : topFunc.getOps<ProcessOp>()) {
              //Check if the result is used as the input of another dataflow.process
              auto accumOperand_child = process_child->getOperand(2);                  
              if (accumOperand_child==result){
                  //Assign the a chain of AIE tiles with dependency to a column
                  row_postion++;
                  process_child->setAttr("polyaie.col",b.getI64IntegerAttr(col_postion));
                  process_child->setAttr("polyaie.row",b.getI64IntegerAttr(row_postion));
                  end_chain=0;
                  result=process_child.getResult(0);
                  break;
              }
            }
            
          }
          col_postion++;
        }
      }
          
    }   


    //Second round
    //Place the input GMIO tiles according to the dependency and data reuse mechanism
    for (auto process : topFunc.getOps<ProcessOp>()) {

      //Detect the chain (tiles with true dependency)
      auto accumOperand = process->getOperand(2);
      // The start of the chain has the accumulator defined by TensorLoadOp
      if (auto tensorOp=accumOperand.getDefiningOp<dataflow::TensorLoadOp>()){
        int ID_L=0;
        int ID_R=0;
        int flag=0;

        Value source_L = process->getOperand(0);
        Value source_R = process->getOperand(1);
        auto tensorOp_SL = source_L.getDefiningOp();
        auto tensorOp_SR = source_R.getDefiningOp();

        if(!(tensorOp_SL->getAttr("polyaie.col"))){
          tensorOp_SL->setAttr("polyaie.col",b.getI64IntegerAttr(io_in.at(current_port_in)));
          tensorOp_SL->setAttr("polyaie.row",b.getI64IntegerAttr(0));
          tensorOp_SL->setAttr("polyaie.channel",b.getI64IntegerAttr(current_chan_in));
          tensorOp_SL->setAttr("polyaie.PackID",b.getI64IntegerAttr(ID_L%4));
          tensorOp_SL->setAttr("polyaie.reuse",
                               b.getI64IntegerAttr((int)(LHS_reuse)));
          ID_L++;
          LHS_bro_cnt[source_L] = 0;
        } else if (LHS_bro_cnt[source_L] == ((int)(LHS_reuse)-1)) {
          LHS_cnt++;

          tensorOp_SL->setAttr("polyaie.col" + std::to_string(LHS_cnt),
                               b.getI64IntegerAttr(io_in.at(current_port_in)));
          tensorOp_SL->setAttr("polyaie.row" + std::to_string(LHS_cnt),
                               b.getI64IntegerAttr(0));
          tensorOp_SL->setAttr("polyaie.channel" + std::to_string(LHS_cnt),
                               b.getI64IntegerAttr(current_chan_in));
          tensorOp_SL->setAttr("polyaie.PackID" + std::to_string(LHS_cnt),
                               b.getI64IntegerAttr(ID_L % 4));
          ID_L++;
          LHS_bro_cnt[source_L] = 0;
          if (LHS_cnt == std::ceil((float)(C / LHS_reuse)) - 1) {
            LHS_cnt = 0;
          }
        } else {
          LHS_bro_cnt[source_L]++;
        }

        //Assign the GMIOs for all  the left side matrix in the chain
        auto result=process.getResult(0);

        int end_chain=0;
        while(!end_chain){
          end_chain=1;
          for (auto process_child : topFunc.getOps<ProcessOp>()) {
            //Check if the result is used as the input of another dataflow.process
            auto accumOperand_child = process_child->getOperand(2);                  
            if (accumOperand_child==result){
                //Assign left hand side matrix to GMIO
                Value LHS = process_child->getOperand(0);
                auto tensorOp_L = LHS.getDefiningOp();
                //Process if with no placement attached
                if(!(tensorOp_L->getAttr("polyaie.col"))){
                  tensorOp_L->setAttr("polyaie.col",b.getI64IntegerAttr(io_in.at(current_port_in)));
                  tensorOp_L->setAttr("polyaie.row",b.getI64IntegerAttr(0));
                  tensorOp_L->setAttr("polyaie.channel",b.getI64IntegerAttr(current_chan_in));
                  tensorOp_L->setAttr("polyaie.PackID",b.getI64IntegerAttr(ID_L%4));
                  tensorOp_L->setAttr("polyaie.reuse",
                                      b.getI64IntegerAttr((int)(LHS_reuse)));
                  ID_L++;
                  flag = 1;
                  end_chain = 0;
                  result = process_child.getResult(0);
                  LHS_bro_cnt[LHS] = 0;
                  break;
                } else if (LHS_bro_cnt[LHS] == ((int)(LHS_reuse)-1)) {
                  LHS_cnt++;
                  tensorOp_L->setAttr(
                      "polyaie.col" + std::to_string(LHS_cnt),
                      b.getI64IntegerAttr(io_in.at(current_port_in)));
                  tensorOp_L->setAttr("polyaie.row" + std::to_string(LHS_cnt),
                                      b.getI64IntegerAttr(0));
                  tensorOp_L->setAttr("polyaie.channel" +
                                          std::to_string(LHS_cnt),
                                      b.getI64IntegerAttr(current_chan_in));
                  tensorOp_L->setAttr("polyaie.PackID" +
                                          std::to_string(LHS_cnt),
                                      b.getI64IntegerAttr(ID_L % 4));
                  ID_L++;
                  flag=1;
                  end_chain=0;
                  result = process_child.getResult(0);
                  LHS_bro_cnt[LHS] = 0;
                  if (LHS_cnt == std::ceil((float)(C / LHS_reuse) - 1)) {
                    LHS_cnt = 0;
                  }
                  break;
                } else {
                  LHS_bro_cnt[LHS]++;
                  flag = 0;
                  end_chain = 0;
                  result = process_child.getResult(0);
                  break;
                }
            }       
          }
        }
        //Check if one channel is really assigned 
        if(flag){
          current_chan_in=current_chan_in+1;
          flag=0;
          if(current_chan_in==2){
            current_chan_in=0;
            current_port_in++;
          }
        }

        if(!(tensorOp_SR->getAttr("polyaie.col"))){
          tensorOp_SR->setAttr("polyaie.col",b.getI64IntegerAttr(io_in.at(current_port_in)));//
          tensorOp_SR->setAttr("polyaie.row",b.getI64IntegerAttr(0));
          tensorOp_SR->setAttr("polyaie.channel",b.getI64IntegerAttr(current_chan_in));
          tensorOp_SR->setAttr("polyaie.PackID",
                               b.getI64IntegerAttr(ID_R % 4 + 4));
          tensorOp_SR->setAttr("polyaie.reuse",
                               b.getI64IntegerAttr((int)(RHS_reuse)));
          ID_R++;
          RHS_bro_cnt[source_R] = 0;
        } else if (RHS_bro_cnt[source_R] == ((int)(RHS_reuse)-1)) {
          RHS_cnt++;
          tensorOp_SR->setAttr("polyaie.col" + std::to_string(RHS_cnt),
                               b.getI64IntegerAttr(io_in.at(current_port_in)));
          tensorOp_SR->setAttr("polyaie.row" + std::to_string(RHS_cnt),
                               b.getI64IntegerAttr(0));
          tensorOp_SR->setAttr("polyaie.channel" + std::to_string(RHS_cnt),
                               b.getI64IntegerAttr(current_chan_in));
          tensorOp_SR->setAttr("polyaie.PackID" + std::to_string(RHS_cnt),
                               b.getI64IntegerAttr(ID_L % 4));
          ID_R++;
          RHS_bro_cnt[source_R] = 0;
          if (RHS_cnt == std::ceil((float)(A / RHS_reuse) - 1)) {
            RHS_cnt = 0;
          }
        } else {
          RHS_bro_cnt[source_R]++;
        }

        //Assign the GMIOs for all  the right side matrix in the chain
        result=process.getResult(0);
        int end_chain1=0;
        while(!end_chain1){
          end_chain1=1;
          for (auto process_child : topFunc.getOps<ProcessOp>()) {
            //Check if the result is used as the input of another dataflow.process
            auto accumOperand_child = process_child->getOperand(2);                  
            if (accumOperand_child==result){
              //Assign right hand side matrix to GMIO
              auto RHS = process_child->getOperand(1); 
              auto tensorOp_R = RHS.getDefiningOp();
              //Process if with no placement attached
              if(!(tensorOp_R->getAttr("polyaie.col"))){
                tensorOp_R->setAttr("polyaie.col",b.getI64IntegerAttr(io_in.at(current_port_in)));//
                tensorOp_R->setAttr("polyaie.row",b.getI64IntegerAttr(0));
                tensorOp_R->setAttr("polyaie.channel",b.getI64IntegerAttr(current_chan_in));
                tensorOp_R->setAttr("polyaie.PackID",
                                    b.getI64IntegerAttr(ID_R % 4 + 4));
                tensorOp_R->setAttr("polyaie.reuse",
                                    b.getI64IntegerAttr((int)(RHS_reuse)));
                flag=1;
                ID_R++;
                result=process_child.getResult(0);
                end_chain1=0;
                RHS_bro_cnt[RHS] = 0;
                break;
              } else if (RHS_bro_cnt[RHS] == ((int)(RHS_reuse)-1)) {
                RHS_cnt++;
                tensorOp_R->setAttr(
                    "polyaie.col" + std::to_string(RHS_cnt),
                    b.getI64IntegerAttr(io_in.at(current_port_in))); //
                tensorOp_R->setAttr("polyaie.row" + std::to_string(RHS_cnt),
                                    b.getI64IntegerAttr(0));
                tensorOp_R->setAttr("polyaie.channel" + std::to_string(RHS_cnt),
                                    b.getI64IntegerAttr(current_chan_in));
                tensorOp_R->setAttr("polyaie.PackID" + std::to_string(RHS_cnt),
                                    b.getI64IntegerAttr(ID_R % 4 + 4));
                flag = 1;
                ID_R++;
                result = process_child.getResult(0);
                end_chain1 = 0;
                RHS_bro_cnt[RHS] = 0;
                if (RHS_cnt == std::ceil((float)(A / RHS_reuse) - 1)) {
                  RHS_cnt = 0;
                }
                break;
              } else {
                RHS_bro_cnt[RHS]++;
                flag = 0;
                result = process_child.getResult(0);
                end_chain1 = 0;
                break;
              }
            } 
          }
        }
        //Check if one channel is really assigned 
        if(flag){
          current_chan_in=current_chan_in+1;
          flag=0;
          if(current_chan_in==2){
            current_chan_in=0;
            current_port_in++;
          }
        }
      }
    }

    
    //Third round
    //Place the output GMIO tiles according to the dependency and data reuse mechanism

    int current_port_out=0;
    int current_chan_out=0;
    int ID_O=0;
    for (auto tensorOp_O : topFunc.getOps<dataflow::TensorStoreOp>()) {
      tensorOp_O->setAttr("polyaie.col",b.getI64IntegerAttr(io_out.at(current_port_out)));//
      tensorOp_O->setAttr("polyaie.row",b.getI64IntegerAttr(0));
      tensorOp_O->setAttr("polyaie.channel",b.getI64IntegerAttr(current_chan_out));
      tensorOp_O->setAttr("polyaie.PackID",b.getI64IntegerAttr(ID_O));
      ID_O++;
      if(ID_O==4){
        ID_O=0;
        current_chan_out++;
      }
      if(current_chan_out==2){
        current_chan_out=0;
        current_port_out++;
      }
    }


}



std::unique_ptr<Pass> polyaie::createPlacementSimplePass() {
  return std::make_unique<PlacementSimple>();
}

std::unique_ptr<Pass> polyaie::createPlacementSimplePass(const PolyAIEOptions &opts) {
  return std::make_unique<PlacementSimple>(opts);
}
