#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

DRY_RUN="false"
DEBUG_TILE="false"

RETURN_ALL_ARG="false"
TILE_SIZE="32"
VEC_SIZE="1"
ALGORITHM="simulated-annealing"
CREATE_INTERF="false"

EXTERN_KERNEL="true"
OBJECT_FILE="kernel.o"
GEN_EXTERN_KERNEL="false"
VITIS_DIR=/tools/Xilinx/Vitis/2020.1


# Get the absolute path of the current directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
MLIRAIE_DIR=${DIR}/../../mlir-aie
LLVMTOOLS_DIR=${DIR}/../../llvm/build/bin
TMP_DIR=${DIR}/tmp
BOARD_DIR=${TMP_DIR}/board
rm -rf ${TMP_DIR}
mkdir -p ${TMP_DIR}


# Run polyaie to generate the AIE IR of GEMM.
PIPELINE_OPTS="top-func-name=gemm "
PIPELINE_OPTS+="return-all-arg=${RETURN_ALL_ARG} "
PIPELINE_OPTS+="tile-size=${TILE_SIZE} "
PIPELINE_OPTS+="vec-size=${VEC_SIZE} "
PIPELINE_OPTS+="algorithm=${ALGORITHM} "
PIPELINE_OPTS+="enable-create-interface=${CREATE_INTERF} "
PIPELINE_OPTS+="enable-link-extern-kernel=${EXTERN_KERNEL} "
PIPELINE_OPTS+="object-file=${OBJECT_FILE} "
PIPELINE_OPTS+="gen-extern-kernel"=${GEN_EXTERN_KERNEL}

polyaie-opt ${DIR}/gemm.mlir \
  -polyaie-pipeline="${PIPELINE_OPTS}" \
  1> ${TMP_DIR}/gemm.polyaie.mlir \
  2> ${TMP_DIR}/gemm.polyaie.dot

dot -Tpng ${TMP_DIR}/gemm.polyaie.dot \
  > ${TMP_DIR}/gemm.polyaie.df.png
dot -Tpng -Kfdp ${TMP_DIR}/gemm.polyaie.dot \
  > ${TMP_DIR}/gemm.polyaie.layout.png


# Generate the host kernel related files.
polyaie-translate ${TMP_DIR}/gemm.polyaie.mlir \
  -export-host-kernel \
  -dry-run-host-kernel=${DRY_RUN} \
  -debug-tile=${DEBUG_TILE} \
  > ${TMP_DIR}/gemm.host.cpp

cp ${DIR}/gemm.cpp ${TMP_DIR}


# Generate the AIE kernel related files.
if [ ${GEN_EXTERN_KERNEL} = true ]; then
  polyaie-translate ${TMP_DIR}/gemm.polyaie.mlir \
    -export-aie-kernel \
    > ${TMP_DIR}/gemm.kernel.cc
fi

source ${VITIS_DIR}/settings64.sh
if [ ${EXTERN_KERNEL} = true ]; then
  if [ ${GEN_EXTERN_KERNEL} = true ]; then
    ${VITIS_DIR}/cardano/bin/xchesscc -g -p me \
      -P ${VITIS_DIR}/cardano/data/cervino/lib \
      -o ${TMP_DIR}/kernel.o \
      -c ${TMP_DIR}/gemm.kernel.cc
  else
    ${VITIS_DIR}/cardano/bin/xchesscc -g -p me \
      -P ${VITIS_DIR}/cardano/data/cervino/lib \
      -I ${VITIS_DIR}/cardano/include \
      -o ${TMP_DIR}/kernel.o \
      -c ${DIR}/kernel.cc
  fi
fi

# Generate the AIE and host executables on VCK190.
polyaie-opt -polyaie-codegen-cleanup \
  ${TMP_DIR}/gemm.polyaie.mlir \
  > ${TMP_DIR}/gemm.polyaie.mliraie.mlir

cd ${TMP_DIR}
export PATH=${LLVMTOOLS_DIR}:$PATH
${MLIRAIE_DIR}/build/bin/aiecc.py -j10 \
  --sysroot=${MLIRAIE_DIR}/platforms/vck190_bare/petalinux/sysroot/sysroots/aarch64-xilinx-linux \
  ${TMP_DIR}/gemm.polyaie.mliraie.mlir \
  -I${MLIRAIE_DIR}/build/runtime_lib/ -I${DIR} \
  ${MLIRAIE_DIR}/build/runtime_lib/test_library.cpp \
  ${DIR}/polybench.cpp ${TMP_DIR}/gemm.cpp -o ${TMP_DIR}/gemm.elf


# Generate the folder for on-board evaluation.
mkdir -p ${BOARD_DIR}
cp ${TMP_DIR}/gemm.elf ${BOARD_DIR}
cp ${TMP_DIR}/core_*.elf ${BOARD_DIR}
rm ${TMP_DIR}/core_*
