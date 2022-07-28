/proj/rdi/staff/jinmingz/nobkup/polyaie/mlir-aie/build/bin/aiecc.py -v --xbridge --sysroot=/group/xrlabs/platforms/acdc_linux_sysroot ./final.mlir

cp -r acdc_project/aie_inc.cpp ./

rm -rf core* acdc_project

sed -i 's/br/cf.br/g' final.mlir

/group/xrlabs2/acdc-buildbot/installs/2022-04-28_acdc_xsjrdevl/bin/aiecc.py -v --xbridge --sysroot=/group/xrlabs/platforms/acdc_linux_sysroot ./final.mlir

rm -rf acdc_project/aie_inc.cpp

cp -r aie_inc.cpp acdc_project

clang --target=aarch64-linux-gnu -std=c++11 --sysroot=/group/xrlabs/platforms/acdc_linux_sysroot -I/group/xrlabs/platforms/acdc_linux_sysroot/usr/include/c++/9.2.0 -I/group/xrlabs/platforms/acdc_linux_sysroot/usr/include/c++/9.2.0/aarch64-xilinx-linux -I/group/xrlabs/platforms/acdc_linux_sysroot/usr/include/c++/9.2.0/backward -L/group/xrlabs/platforms/acdc_linux_sysroot/usr/lib/aarch64-xilinx-linux/9.2.0 -B/group/xrlabs/platforms/acdc_linux_sysroot/usr/lib/aarch64-xilinx-linux/9.2.0 -I/group/xrlabs/platforms/acdc_linux_sysroot/opt/xaiengine/include -L/group/xrlabs/platforms/acdc_linux_sysroot/opt/xaiengine/lib -Iacdc_project -fuse-ld=lld -lm -rdynamic -lxaiengine -lmetal -lopen_amp -ldl -I/proj/rdi/staff/jinmingz/nobkup/polyaie/mlir-aie/runtime_lib /proj/rdi/staff/jinmingz/nobkup/polyaie/mlir-aie/runtime_lib/test_library.cpp ./test.cpp -o test.elf