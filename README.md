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
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
$ ninja && ninja check-mlir
```

### 2. Install MLIR-AIE
Follow the instructions from https://xilinx.github.io/mlir-aie/.
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
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
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
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
$ ninja check-polyaie
$ export PATH=$PATH:$PWD/bin
```

### 4. Clone and install Phism
Follow the instructions from https://github.com/kumasento/phism.
```sh
$ cd ${PHISM_INSTALL_DIR}
$ git clone --recursive git@github.com:kumasento/phism.git
$ cd phism
$ ./scripts/build-llvm.sh
$ ./scripts/build-polygeist.sh
$ ./scripts/build-polymer.sh
$ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/polymer/build/pluto/lib
$ ./scripts/build-polymer.sh
$ ./scripts/build-phism.sh
$ export PYTHONPATH=$PYTHONPATH:$PWD
```

## GEMM Example
```sh
# Compile a GEMM kernel in C/C++ to executables.
$ cd samples && ./compile.sh
$ scp -r ./tmp/gemm-board/ petalinux@192.168.0.106:/home/petalinux/.

# Run on VCK190 board.
$ export XILINX_XRT=/usr && cd /home/petalinux/gemm-board/ && ./gemm.elf 1 1

# Only compile the host kernel.
$ /usr/bin/clang --target=aarch64-linux-gnu -std=c++11 \
    --sysroot=$PWD/../mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
    -I$PWD/../mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0 \
    -I$PWD/../mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0/aarch64-xilinx-linux \
    -I$PWD/../mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0/backward \
    -L$PWD/../mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/lib/aarch64-xilinx-linux/9.2.0 \
    -B$PWD/../mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/lib/aarch64-xilinx-linux/9.2.0 \
    -fuse-ld=lld -lm -rdynamic -lxaiengine -lmetal -lopen_amp -ldl \
    -I$PWD/../mlir-aie/build/runtime_lib/ -I$PWD/tmp/utilities -I$PWD/tmp/gemm -I$PWD/tmp/gemm/acdc_project \
    $PWD/../mlir-aie/build/runtime_lib/test_library.cpp \
    $PWD/tmp/utilities/polybench.cpp $PWD/tmp/gemm/gemm.cpp -o gemm.elf
```
