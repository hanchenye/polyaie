DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TMP_DIR=${DIR}/128_128_128_new
polyaie-opt gemm.mlir -polyaie-pipeline="top-func-name=gemm vec-size=8" >${TMP_DIR}/0_dataflow.mlir

polyaie-opt ${TMP_DIR}/0_dataflow.mlir -polyaie-placement-simple="col-pos=10 row-pos=2" -canonicalize >${TMP_DIR}/1_placementsimple.mlir
 
polyaie-opt ${TMP_DIR}/1_placementsimple.mlir --polyaie-create-interface >${TMP_DIR}/2_interfacesimple.mlir
 
polyaie-opt ${TMP_DIR}/2_interfacesimple.mlir --polyaie-dataflow-to-aie="gmio-reuse=true" >${TMP_DIR}/3_dataflow2AIEsimple.mlir

polyaie-opt ${TMP_DIR}/2_interfacesimple.mlir -polyaie-print-dataflow -canonicalize 2>${TMP_DIR}/placementsimple.gv
 
dot -Tpng -Kfdp ${TMP_DIR}/placementsimple.gv >${TMP_DIR}/placementsimple.png
 
polyaie-opt ${TMP_DIR}/3_dataflow2AIEsimple.mlir --polyaie-link-extern-kernel="gen-extern-kernel=false" >${TMP_DIR}/4_link_kernel_simple.mlir
 
polyaie-opt ${TMP_DIR}/4_link_kernel_simple.mlir -polyaie-materialize-broadcast="gmio-reuse=true" >${TMP_DIR}/5_materializesimple.mlir
 
../../mlir-aie/build/bin/aie-opt ${TMP_DIR}/5_materializesimple.mlir --aie-create-locks -allow-unregistered-dialect >${TMP_DIR}/6_locksimple.mlir

../../mlir-aie/build/bin/aie-opt ${TMP_DIR}/6_locksimple.mlir --aie-create-broadcast-packet -allow-unregistered-dialect >${TMP_DIR}/7_broadpacketsimple.mlir

# ../../mlir-aie/build/bin/aie-opt ${TMP_DIR}/7_broadpacketsimple.mlir --aie-create-packet-flows -allow-unregistered-dialect >${TMP_DIR}/8_packetflowsimple.mlir

# polyaie-opt ${TMP_DIR}/8_packetflowsimple.mlir --polyaie-postprocess >${TMP_DIR}/9_post_process.mlir

# polyaie-opt -polyaie-codegen-cleanup ${TMP_DIR}/9_post_process.mlir >${TMP_DIR}/final.mlir

# polyaie-opt -polyaie-test ${TMP_DIR}/final.mlir >${TMP_DIR}/try.mlir

# ../../mlir-aie/build/bin/aie-translate --aie-generate-xaie ${TMP_DIR}/try.mlir >${TMP_DIR}/final.cpp

# polyaie-translate ${TMP_DIR}/9_post_process.mlir -export-host-kernel >${TMP_DIR}/gemm.host.cpp

# cp -r 64_64_64/test.cpp 64_64_64/run.sh ${TMP_DIR}
