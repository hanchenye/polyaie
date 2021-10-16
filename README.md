# PolyAIE Project (polyaie)

## 2mm Example
```sh
polyaie-opt test/2mm.pre.kern.plmr.ca.lt.mlir \
    -polyaie-affine-preprocess="top-func-name=kernel_2mm" | \
    scalehls-opt -simplify-affine-if -canonicalize | \
    polyaie-opt -polyaie-convert-to-aie
```

<!-- -affine-super-vectorize="virtual-vector-size=32" -->

## TODO
- Destination tile can only support two DMA channels (S2MM), this needs to be solved through (1) real dependency information (2) more advanced placement algorithm to avoid routing congestion.
- How to use FPGA DMA? to transfer unchanged arrays?

## Quick Start
### 1. Install LLVM and MLIR
```sh
$ git clone https://github.com/llvm/llvm-project $LLVM_DIR
$ cd llvm-project
$ git checkout b340cadeacc4f0011cf56e82e0fbca6faa166777
$ mkdir $LLVM_DIR/build
$ cd $LLVM_DIR/build
$ cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS="mlir" \
    -DLLVM_TARGETS_TO_BUILD="host" \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG
$ ninja
$ ninja check-mlir
```

### 2. Install MLIR-AIE
Follow the instructions from https://github.com/Xilinx/mlir-aie

### 3. Install PolyAIE
```sh
$ git clone $POLYAIE_DIR
$ mkdir $POLYAIE_DIR/build
$ cd $POLYAIE_DIR/build
$ cmake -G Ninja .. \
    -DMLIR_DIR=$PWD/../../onnx-mlir-llvm-project/build/lib/cmake/mlir \
    -DLLVM_DIR=$PWD/../../onnx-mlir-llvm-project/build/lib/cmake/llvm \
    -DAIE_DIR=$PWD/../../mlir-aie/build/lib/cmake/aie \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DLLVM_USE_LINKER=lld-10 \
    -DCMAKE_C_COMPILER=clang-10 \
    -DCMAKE_CXX_COMPILER=clang++-10
$ ninja check-polyaie
```
