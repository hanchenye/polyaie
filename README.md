# PolyAIE Project (polyaie)

## 2mm Example
```sh
$ python scripts/pb-flow.py --polymer --loop-transforms --dataset MINI example/polybench

$ sed -E 's/arith.//g; s/f64/f32/g; s/andi/and/g; s/alloca/alloc/g' 2mm.pre.kern.plmr.ca.lt.mlir > 2mm.phism.mlir
$ polyaie-opt -polyaie-pipeline="top-func-name=kernel_2mm" 2mm.phism.mlir 1> 2mm.phism.pre.df.place.aie.mlir 2> 2mm.phism.pre.df.place.dot
$ polyaie-translate -export-host-kernel 2mm.phism.pre.df.place.aie.mlir > 2mm.host.cpp

$ dot -Tpng 2mm.phism.pre.df.place.dot > 2mm.phism.pre.df.place.png
$ dot -Tpng -Kfdp 2mm.phism.pre.df.place.dot > 2mm.phism.pre.df.place.png
$ sed -E -i 's/,\s#map[[:digit:]]//g; /memcpy/d; /alloc/d; /affine\_map/d' 2mm.phism.pre.df.place.aie.mlir

$ source /tools/Xilinx/Vitis/2020.1/settings64.sh
$ /home/hanchenye/workspace/mlir-aie/build/bin/aiecc.py \
    --sysroot=/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
    2mm.phism.pre.df.place.aie.mlir \
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
```sh
/usr/bin/cmake -GNinja .. \
    -DLLVM_DIR=/home/hanchenye/workspace/mlir-aie-llvm-project/build/lib/cmake/llvm \
    -DMLIR_DIR=/home/hanchenye/workspace/mlir-aie-llvm-project/build/lib/cmake/mlir \
    -DCMAKE_MODULE_PATH=/home/hanchenye/workspace/cmakeModules \
    -DVitisSysroot=/home/hanchenye/workspace/mlir-aie/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
    -DCMAKE_BUILD_TYPE=Debug

    cmd += ['-I%s/usr/include/c++/9.2.0' % opts.sysroot]
    cmd += ['-I%s/usr/include/c++/9.2.0/aarch64-xilinx-linux' % opts.sysroot]
    cmd += ['-I%s/usr/include/c++/9.2.0/backward' % opts.sysroot]
    cmd += ['-L%s/usr/lib/aarch64-xilinx-linux/9.2.0' % opts.sysroot]
    cmd += ['-B%s/usr/lib/aarch64-xilinx-linux/9.2.0' % opts.sysroot]
``

### 3. Install PolyAIE
```sh
$ git clone $POLYAIE_DIR
$ mkdir $POLYAIE_DIR/build
$ cd $POLYAIE_DIR/build
$ /usr/bin/cmake -G Ninja .. \
    -DMLIR_DIR=$PWD/../../mlir-aie-llvm-project/build/lib/cmake/mlir \
    -DLLVM_DIR=$PWD/../../mlir-aie-llvm-project/build/lib/cmake/llvm \
    -DAIE_DIR=$PWD/../../mlir-aie/build/lib/cmake/aie \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DLLVM_USE_LINKER=lld \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
$ ninja check-polyaie
```
