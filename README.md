# PolyAIE Project

## 2mm Example
```sh
$ python phism/scripts/pb-flow.py --polymer --loop-transforms --dataset SMALL --skip-vitis --skip-csim phism/example/polybench

$ sed -E 's/arith.//g; s/f64/f32/g; s/andi/and/g; s/alloca/alloc/g' 2mm.pre.kern.plmr.ca.lt.mlir > 2mm.phism.mlir
$ polyaie-opt -polyaie-pipeline="top-func-name=kernel_2mm" 2mm.phism.mlir 1> 2mm.phism.polyaie.mlir 2> 2mm.phism.polyaie.dot
$ polyaie-opt -polyaie-pipeline="top-func-name=kernel_2mm algorithm=simulated-annealing" 2mm.phism.mlir 1> 2mm.phism.polyaie.mlir 2> 2mm.phism.polyaie.dot
$ polyaie-translate -export-host-kernel 2mm.phism.polyaie.mlir > 2mm.host.cpp

$ dot -Tpng 2mm.phism.polyaie.dot > 2mm.phism.polyaie.png && dot -Tpng -Kfdp 2mm.phism.polyaie.dot > 2mm.phism.polyaie.layout.png
$ sed -E 's/,\s#map[[:digit:]]//g; /memcpy/d; /alloc/d; /affine\_map/d' 2mm.phism.polyaie.mlir > 2mm.phism.polyaie.mliraie.mlir

$ source /tools/Xilinx/Vitis/2020.1/settings64.sh
$ /home/hanchenye/workspace/mlir-aie/build/bin/aiecc.py \
    --sysroot=/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
    2mm.phism.polyaie.mliraie.mlir \
    -I/home/hanchenye/workspace/mlir-aie/build/runtime_lib/ -I${PWD} \
    /home/hanchenye/workspace/mlir-aie/build/runtime_lib/test_library.cpp \
    polybench.cpp 2mm.host.cpp 2mm.cpp -o 2mm.elf

$ /home/hanchenye/workspace/mlir-aie-llvm-project/build/bin/clang \
    --target=aarch64-linux-gnu -std=c++11 \
    --sysroot=/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
    -I/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0 \
    -I/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0/aarch64-xilinx-linux \
    -I/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/include/c++/9.2.0/backward \
    -L/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/lib/aarch64-xilinx-linux/9.2.0 \
    -B/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux/usr/lib/aarch64-xilinx-linux/9.2.0 \
    -Iacdc_project -fuse-ld=lld -rdynamic -lxaiengine -lmetal -lopen_amp -ldl \
    -I/home/hanchenye/workspace/mlir-aie/build/runtime_lib/ -I${PWD} \
    /home/hanchenye/workspace/mlir-aie/build/runtime_lib/test_library.cpp \
    polybench.cpp 2mm.host.cpp 2mm.cpp -o 2mm.elf
```

<!-- -affine-super-vectorize="virtual-vector-size=32" -->

## Quick Start
### 0. Clone this repository
```sh
$ git clone --recursive git@github.com:hanchenye/polyaie.git
```

### 1. Install MLIR
```sh
$ cd llvm
$ mkdir build && cd build
$ cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS="mlir" \
    -DLLVM_TARGETS_TO_BUILD=host \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_BUILD_UTILS=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
$ ninja && ninja check-mlir
```

### 2. Install MLIR-AIE
Follow the instructions from https://github.com/Xilinx/mlir-aie
```sh
$ cd mlir-aie
$ source /tools/Xilinx/Vitis/2020.1/settings64.sh # Your Vitis settings script.
$ source ~/tools/Xilinx/PetaLinux/settings.sh # Your PetaLinux settings script.
$ cd platforms/vck190_bare && make all && cd ../..
$ mkdir build && cd build
$ /usr/bin/cmake -GNinja .. \
    -DLLVM_DIR=${PWD}/../../llvm/build/lib/cmake/llvm \
    -DMLIR_DIR=${PWD}/../../llvm/build/lib/cmake/mlir \
    -DCMAKE_MODULE_PATH=${PWD}/../../cmakeModules \
    -DVitisSysroot=${PWD}/../platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
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
    -DMLIR_DIR=${PWD}/../llvm/build/lib/cmake/mlir \
    -DLLVM_DIR=${PWD}/../llvm/build/lib/cmake/llvm \
    -DAIE_DIR=${PWD}/../mlir-aie/build/lib/cmake/aie \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
$ ninja check-polyaie
$ export PATH=$PATH:${PWD}/bin
```

### 4. Install Phism
```sh
$ cd phism
$ git submodule update --init --recursive
$ ./scripts/build-llvm.sh
$ ./scripts/build-polygeist.sh
$ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PWD}/polymer/build/pluto/lib
$ ./scripts/build-polymer.sh
$ ./scripts/build-phism.sh
$ export PYTHONPATH=$PYTHONPATH:/home/hanchenye/workspace/polyaie/phism
```
