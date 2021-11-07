# PolyAIE Project (polyaie)

## 2mm Example
```sh
$ python scripts/pb-flow.py --polymer --loop-transforms --dataset MINI example/polybench

$ sed -E 's/arith.//g; s/f64/i32/g; s/mulf/muli/g; s/addf/addi/g; s/0\.000000e\+00/0/g' 2mm.pre.kern.plmr.ca.lt.mlir > 2mm.phism.mlir
$ polyaie-opt 2mm.phism.mlir -polyaie-affine-preprocess="top-func-name=kernel_2mm" -canonicalize > 2mm.phism.pre.mlir
# $ scalehls-opt -simplify-affine-if -canonicalize
$ polyaie-opt 2mm.phism.pre.mlir -polyaie-convert-to-aie > 2mm.phism.pre.aie.mlir

$ /home/hanchenye/workspace/mlir-aie/build/bin/aiecc.py \
    --sysroot=/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux 2mm.phism.pre.aie.mlir \
    -I/home/hanchenye/workspace/mlir-aie/build/runtime_lib/ /home/hanchenye/workspace/mlir-aie/build/runtime_lib/test_library.cpp 2mm_test.cpp -o 2mm_test.elf

$ /home/hanchenye/workspace/mlir-aie-llvm-project/build/bin/clang \
    --target=aarch64-linux-gnu -std=c++11 \
    --sysroot=/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
    -I/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0 \
    -I/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0/aarch64-xilinx-linux \
    -I/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0/backward \
    -L/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/lib/aarch64-xilinx-linux/9.2.0 \
    -B/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/lib/aarch64-xilinx-linux/9.2.0 \
    -Iacdc_project -fuse-ld=lld -rdynamic -lxaiengine -lmetal -lopen_amp -ldl \
    -I/home/hanchenye/workspace/mlir-aie/build/runtime_lib/ /home/hanchenye/workspace/mlir-aie/build/runtime_lib/test_library.cpp 2mm_test.cpp -o 2mm_test.elf
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
