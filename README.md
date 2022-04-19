# PolyAIE Project

## Quick Start
### 0. Clone PolyAIE
```sh
$ git clone --recursive git@github.com:hanchenye/polyaie.git
$ cd polyaie
```

### 1. Install MLIR
```sh
$ cd llvm
$ mkdir build && cd build
$ cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_TARGETS_TO_BUILD=host \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
$ ninja && ninja check-mlir
```

### 2. Install MLIR-AIE
```sh
$ cd mlir-aie

$ # (Optional) Build VCK190 platform for generating executables.
$ source /tools/Xilinx/Vitis/2020.1/settings64.sh # Your Vitis settings script.
$ source ~/tools/Xilinx/PetaLinux/settings.sh # Your PetaLinux settings script.
$ cd platforms/vck190_bare && make all && cd ../..

$ # Build MLIR-AIE compilation flow.
$ mkdir build && cd build
$ /usr/bin/cmake -G Ninja .. \
    -DLLVM_DIR=$PWD/../../llvm/build/lib/cmake/llvm \
    -DMLIR_DIR=$PWD/../../llvm/build/lib/cmake/mlir \
    -DCMAKE_MODULE_PATH=$PWD/../../cmakeModules \
    -DVitisSysroot=$PWD/../platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
$ ninja && ninja check-aie
```

### 3. Install PolyAIE
```sh
$ mkdir build && cd build
$ /usr/bin/cmake -G Ninja .. \
    -DLLVM_DIR=$PWD/../llvm/build/lib/cmake/llvm \
    -DMLIR_DIR=$PWD/../llvm/build/lib/cmake/mlir \
    -DAIE_DIR=$PWD/../mlir-aie/build/lib/cmake/aie \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
$ ninja check-polyaie
$ export PATH=$PATH:$PWD/bin
```

## GEMM Example
```sh
# Compile a GEMM kernel in MLIR to executables.
$ cd samples/gemm && ./compile.sh
$ scp -r ./tmp/board/ petalinux@192.168.0.106:/home/petalinux/.

# Run on VCK190 board.
$ export XILINX_XRT=/usr && cd /home/petalinux/board/ && ./gemm.elf 1 1
```
