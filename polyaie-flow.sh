#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# The absolute path to the directory of this script.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

for d in */; do
  if [ ${d} != "symm/" -a ${d} != "syr2k/" -a ${d} != "syrk/" -a ${d} != "trmm/" -a ${d} != "3mm/" -a ${d} != "doitgen/" ]; then
    cd ${d}
    echo "Working on ${d::-1}..."
    input_mlir="${d::-1}.pre.kern.plmr.ca.lt.mlir"
    phism_mlir="${d::-1}.phism.mlir"
    polyaie_mlir="${d::-1}.phism.polyaie.mlir"
    host_cpp="${d::-1}.host.cpp"
    polyaie_dot="${d::-1}.phism.polyaie.dot"
    place_png="${d::-1}.phism.polyaie.place.png"
    dataflow_png="${d::-1}.phism.polyaie.df.png"
    mliraie_mlir="${d::-1}.phism.polyaie.mliraie.mlir"

    if [ -f ${input_mlir} ]; then
      sed -E 's/arith.//g; s/f64/f32/g; s/andi/and/g; s/alloca/alloc/g; s/llvm.linkage[[:space:]]=[[:space:]]#llvm.linkage<external>,//g' ${input_mlir} > ${phism_mlir}
      polyaie-opt -polyaie-pipeline="top-func-name=kernel_${d::-1} algorithm=simulated-annealing" ${phism_mlir} 1> ${polyaie_mlir} 2> ${polyaie_dot}
      dot -Tpng ${polyaie_dot} > ${dataflow_png} && dot -Tpng -Kfdp ${polyaie_dot} > ${place_png}
      polyaie-translate -export-host-kernel ${polyaie_mlir} > ${host_cpp}
      sed -E 's/,\s#map[[:digit:]]//g; /memcpy/d; /alloc/d; /affine\_map/d' ${polyaie_mlir} > ${mliraie_mlir}
    fi
    cd ..
  fi

done
