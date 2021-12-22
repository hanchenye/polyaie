#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

DRY_RUN=false
EXTERN_KERNEL=true
OBJECT_FILE="kernel.o"
VITIS_DIR=/tools/Xilinx/Vitis/2020.1

# Get the absolute path of the current directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
GEMM_DIR=${DIR}/tmp/gemm
UTIL_DIR=${DIR}/tmp/utilities
MLIRAIE_DIR=${DIR}/../mlir-aie
GEMMBOARD_DIR=${DIR}/tmp/gemm-board


# Run phism flow to generate the tiled IR of GEMM.
rm -rf ${DIR}/tmp
python pb-flow.py ${DIR}/polybench \
  --work-dir ${DIR}/tmp \
  --examples gemm \
  --dataset SMALL \
  --tile-sizes 32 32 32 \
  --polymer \
  --loop-transforms \
  --skip-vitis \
  --skip-csim


# Run polyaie to generate the AIE IR of GEMM.
polyaie-opt ${GEMM_DIR}/gemm.pre.kern.plmr.ca.lt.mlir \
  -polyaie-pipeline="top-func-name=kernel_gemm algorithm=simulated-annealing enable-link-extern-kernel=${EXTERN_KERNEL} object-file=${OBJECT_FILE}" \
  1> ${GEMM_DIR}/gemm.polyaie.mlir \
  2> ${GEMM_DIR}/gemm.polyaie.dot

dot -Tpng ${GEMM_DIR}/gemm.polyaie.dot \
  > ${GEMM_DIR}/gemm.polyaie.df.png

dot -Tpng -Kfdp ${GEMM_DIR}/gemm.polyaie.dot \
  > ${GEMM_DIR}/gemm.polyaie.layout.png

sed -E '/memcpy/d; /alloc/d' \
  ${GEMM_DIR}/gemm.polyaie.mlir \
  > ${GEMM_DIR}/gemm.polyaie.mliraie.mlir


# Generate the host kernel related files.
polyaie-translate ${GEMM_DIR}/gemm.polyaie.mlir \
  -export-host-kernel \
  -dry-run-host-kernel=${DRY_RUN} \
  > ${GEMM_DIR}/gemm.host.cpp

sed -E 's/\/\/[[:space:]]//g' \
  ${GEMM_DIR}/gemm.c \
  > ${GEMM_DIR}/gemm.cpp

cp ${UTIL_DIR}/polybench.c ${UTIL_DIR}/polybench.cpp


# Generate the executables on VCK190.
source ${VITIS_DIR}/settings64.sh
cd ${GEMM_DIR}
${VITIS_DIR}/cardano/bin/xchesscc -p me -P ${VITIS_DIR}/cardano/data/cervino/lib -I${VITIS_DIR}/cardano/include -c ${GEMM_DIR}/kernel.cc
${MLIRAIE_DIR}/build/bin/aiecc.py -j10 \
  --sysroot=${MLIRAIE_DIR}/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
  ${GEMM_DIR}/gemm.polyaie.mliraie.mlir \
  -I${MLIRAIE_DIR}/build/runtime_lib/ -I${UTIL_DIR} -I${GEMM_DIR} \
  ${MLIRAIE_DIR}/build/runtime_lib/test_library.cpp \
  ${UTIL_DIR}/polybench.cpp ${GEMM_DIR}/gemm.cpp -o ${GEMM_DIR}/gemm.elf


# Generate the folder for on-board evaluation.
mkdir ${GEMMBOARD_DIR}
cp gemm.elf ${GEMMBOARD_DIR}
cp core_*.elf ${GEMMBOARD_DIR}
rm core_*
