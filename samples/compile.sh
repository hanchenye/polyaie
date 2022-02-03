#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

DRY_RUN="true"
DEBUG_TILE="false"

RETURN_ALL_ARG="false"
VEC_SIZE="8"
ALGORITHM="simulated-annealing"
CREATE_INTERF="false"

EXTERN_KERNEL="true"
OBJECT_FILE="kernel.o"
GEN_EXTERN_KERNEL="true"
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
PIPELINE_OPTS="top-func-name=kernel_gemm "
PIPELINE_OPTS+="return-all-arg=${RETURN_ALL_ARG} "
PIPELINE_OPTS+="vec-size=${VEC_SIZE} "
PIPELINE_OPTS+="algorithm=${ALGORITHM} "
PIPELINE_OPTS+="enable-create-interface=${CREATE_INTERF} "
PIPELINE_OPTS+="enable-link-extern-kernel=${EXTERN_KERNEL} "
PIPELINE_OPTS+="object-file=${OBJECT_FILE} "
PIPELINE_OPTS+="gen-extern-kernel"=${GEN_EXTERN_KERNEL}

polyaie-opt ${GEMM_DIR}/gemm.pre.kern.plmr.ca.lt.mlir \
  -polyaie-pipeline="${PIPELINE_OPTS}" \
  1> ${GEMM_DIR}/gemm.polyaie.mlir \
  2> ${GEMM_DIR}/gemm.polyaie.dot

dot -Tpng ${GEMM_DIR}/gemm.polyaie.dot \
  > ${GEMM_DIR}/gemm.polyaie.df.png
dot -Tpng -Kfdp ${GEMM_DIR}/gemm.polyaie.dot \
  > ${GEMM_DIR}/gemm.polyaie.layout.png


# Generate the host kernel related files.
polyaie-translate ${GEMM_DIR}/gemm.polyaie.mlir \
  -export-host-kernel \
  -dry-run-host-kernel=${DRY_RUN} \
  -debug-tile=${DEBUG_TILE} \
  > ${GEMM_DIR}/gemm.host.cpp

sed -E 's/\/\/[[:space:]]//g' \
  ${GEMM_DIR}/gemm.c \
  > ${GEMM_DIR}/gemm.cpp

cp ${UTIL_DIR}/polybench.c ${UTIL_DIR}/polybench.cpp


# Generate the AIE kernel related files.
polyaie-translate ${GEMM_DIR}/gemm.polyaie.mlir \
  -export-aie-kernel \
  > ${GEMM_DIR}/gemm.kernel.cc

source ${VITIS_DIR}/settings64.sh
cd ${GEMM_DIR}
if [ ${EXTERN_KERNEL} = true ]; then
  if [ ${GEN_EXTERN_KERNEL} = true ]; then
    ${VITIS_DIR}/cardano/bin/xchesscc -g -p me \
      -P ${VITIS_DIR}/cardano/data/cervino/lib \
      -o ${GEMM_DIR}/kernel.o \
      -c ${GEMM_DIR}/gemm.kernel.cc
  else
    ${VITIS_DIR}/cardano/bin/xchesscc -g -p me \
      -P ${VITIS_DIR}/cardano/data/cervino/lib \
      -I ${VITIS_DIR}/cardano/include \
      -c ${GEMM_DIR}/kernel.cc
  fi
fi


# Generate the AIE and host executables on VCK190.
polyaie-opt -polyaie-codegen-cleanup \
  ${GEMM_DIR}/gemm.polyaie.mlir \
  > ${GEMM_DIR}/gemm.polyaie.mliraie.mlir

${MLIRAIE_DIR}/build/bin/aiecc.py -j10 \
  --sysroot=${MLIRAIE_DIR}/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
  ${GEMM_DIR}/gemm.polyaie.mliraie.mlir \
  -I${MLIRAIE_DIR}/build/runtime_lib/ -I${UTIL_DIR} -I${GEMM_DIR} \
  ${MLIRAIE_DIR}/build/runtime_lib/test_library.cpp \
  ${UTIL_DIR}/polybench.cpp ${GEMM_DIR}/gemm.cpp -o ${GEMM_DIR}/gemm.elf


# Generate the folder for on-board evaluation.
mkdir -p ${GEMMBOARD_DIR}
cp gemm.elf ${GEMMBOARD_DIR}
cp core_*.elf ${GEMMBOARD_DIR}
rm core_*
rm gemm.pre.*
