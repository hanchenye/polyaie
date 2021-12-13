#
#Copyright 2020 Xilinx, Inc.
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#    http://www.apache.org/licenses/LICENSE-2.0
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#
TARGET   = hw_emu
MODE	 = linux
HOST_ARCH = aarch64
PLATFORM_REPO_PATHS=/opt/xilinx/platforms
PLATFORM = ${PLATFORM_REPO_PATHS}/xilinx_vck190_base_202110_1/xilinx_vck190_base_202110_1.xpfm
XCLBIN   = vck190_aie_base_graph_${TARGET}.xclbin
XSA	 = vck190_aie_base_graph_${TARGET}.xsa
XPFM	 = vck190_xpfm
HOST_EXE = hostexe
HOST_SRCS := ./aie/host.cpp
SYSROOT = /home/Jinming/Versal/sysroots/cortexa72-cortexa53-xilinx-linux
SDKTARGETSYSROOT = ${SYSROOT}
EDGE_COMMON_SW=/home/Jinming/xilinx-versal-common-v2021.1
ROOTFS=${EDGE_COMMON_SW}/rootfs.ext4
IMAGE=${EDGE_COMMON_SW}/Image

FINAL_XCLBIN=ddr_${TARGET}.xclbin
TEMP_DIR := ./_x.$(TARGET).xilinx_vck190_base_202110_1
BUILD_DIR := ./build_dir.$(TARGET).xilinx_vck190_base_202110_1

KERNEL_XO := $(TEMP_DIR)/pl_s2mm.xo $(TEMP_DIR)/pl_mm2s.xo 
GRAPH    = aie/aie_graph.cpp
LIBADF  = libadf.a
AIE_CMPL_CMD = aiecompiler -platform=${PLATFORM} -include="./aie" -workdir=./Work -v ${GRAPH} 
AIE_SIM_CMD = aiesimulator --pkg-dir=./Work --dump-vcd foo --profile
EMU_CMD = ./launch_hw_emu.sh
PACKAGE_OUT = ./package.$(TARGET)
RM = rm -f
RMDIR = rm -rf
##########################################################################################################################################################
### DO NOT MODIFY BELOW THIS LINE UNLESS NECESSARY
################################################################################################################################################


BINARY_CONTAINERS += $(BUILD_DIR)/${XCLBIN}
VCC      = v++
VPP_SPEC = system.cfg
VPP_XO_FLAGS := -c --platform $(PLATFORM) --save-temps -g
VPP_FLAGS=--save-temps --verbose --config ${VPP_SPEC}  
LDCLFLAGS=



GCC_FLAGS := -Wall -c \
			 -std=c++14 \
			 -Wno-int-to-pointer-cast \
			 --sysroot=$(SYSROOT) \

GCC_INCLUDES := -I$(SYSROOT)/usr/include/xrt \
				-I./  \
				-I${XILINX_VITIS}/aietools/include \
				-I${XILINX_VITIS}/include \
				-I./aie
				#-I$(SYSROOT)/usr/include \


GCC_LIB := -lxaiengine -ladf_api_xrt -lxrt_core -lxrt_coreutil \
		   -L$(SYSROOT)/usr/lib \
		   --sysroot=$(SYSROOT) \
		   -L${XILINX_VITIS}/aietools/lib/aarch64.o


CXX := $(XILINX_VITIS)/gnu/aarch64/lin/aarch64-linux/bin/aarch64-linux-gnu-g++


CLFLAGS += -t $(TARGET) --platform $(PLATFORM) --save-temps 
ifneq ($(TARGET), hw)
	CLFLAGS += -g
endif


# Kernel linker flags
LDCLFLAGS += --config system.cfg

.PHONY: clean

###
# Guarding Checks. Do not modify.
###
check_defined = \
	$(strip $(foreach 1,$1, \
		$(call __check_defined,$1,$(strip $(value 2)))))

__check_defined = \
	$(if $(value $1),, \
		$(error Undefined $1$(if $2, ($2))))

guard-PLATFORM_REPO_PATHS:
	$(call check_defined, PLATFORM_REPO_PATHS, Set your where you downloaded xilinx_vck190_es1_base_202110_1)

guard-ROOTFS:
	$(call check_defined, ROOTFS, Set to: xilinx-versal-common-v2021.1/rootfs.ext4)

guard-IMAGE:
	$(call check_defined, IMAGE, Set to: xilinx-versal-common-v2021.1/Image)

guard-CXX:
	$(call check_defined, CXX, Run: xilinx-versal-common-v2021.1/environment-setup-cortexa72-cortexa53-xilinx-linux)

guard-SDKTARGETSYSROOT:
	$(call check_defined, SDKTARGETSYSROOT, Run: xilinx-versal-common-v2021.1/environment-setup-cortexa72-cortexa53-xilinx-linux)

###

all: aie ${XCLBIN} ${HOST_EXE} package
run: all run_hw_emu
sd_card: all

aie: guard-PLATFORM_REPO_PATHS ${LIBADF}
${LIBADF}: ${GRAPH}
	${AIE_CMPL_CMD}
	@echo "COMPLETE: aie success."

aiesim: ${LIBADF}
	${AIE_SIM_CMD}
	@echo "COMPLETE: aiesim success."


kernels: $(KERNEL_XO)
	mkdir -p $(TEMP_DIR)
	@echo "COMPLETE: Kernels Created."	

$(TEMP_DIR)/pl_s2mm.xo: aie/pl_s2mm.cpp
	$(VCC) $(VPP_XO_FLAGS) -k $(basename $(notdir $<)) $< -o $@
$(TEMP_DIR)/pl_mm2s.xo: aie/pl_mm2s.cpp
	$(VCC) $(VPP_XO_FLAGS) -k $(basename $(notdir $<)) $< -o $@

build: $(BINARY_CONTAINERS)
$(BUILD_DIR)/${XCLBIN}: ${KERNEL_XO} ${LIBADF}
	mkdir -p $(BUILD_DIR)
	$(VCC) $(CLFLAGS) --temp_dir $(BUILD_DIR) -l $(LDCLFLAGS) -o'$@' $(+)


host: guard-CXX guard-SDKTARGETSYSROOT ${HOST_EXE}
${HOST_EXE}:
	$(CXX) $(GCC_FLAGS) $(GCC_INCLUDES) -o aie_control_xrt.o ./Work/ps/c_rts/aie_control_xrt.cpp
	$(CXX) $(HOST_SRCS) $(GCC_FLAGS) $(GCC_INCLUDES) -o main.o
	$(CXX) *.o $(GCC_LIB) -o $(HOST_EXE)
	@echo "COMPLETE: Host application created."

ECHO:= @echo
gen_run_app:
ifneq ($(HOST_ARCH), x86)
	rm -rf run_app.sh
	$(ECHO) 'export LD_LIBRARY_PATH=/mnt:/tmp:$$LD_LIBRARY_PATH' >> run_app.sh
	$(ECHO) 'export PATH=$$PATH:/sbin' >> run_app.sh
	$(ECHO) 'export XILINX_XRT=/usr' >> run_app.sh
ifeq ($(TARGET),$(filter $(TARGET),sw_emu hw_emu))
	$(ECHO) 'export XILINX_VITIS=$$PWD' >> run_app.sh
	$(ECHO) 'export XCL_EMULATION_MODE=$(TARGET)' >> run_app.sh
endif
	$(ECHO) 'dmesg -n 4 && echo "Hide DRM messages..."' >> run_app.sh
	$(ECHO) './${HOST_EXE} ${FINAL_XCLBIN}' >> run_app.sh
	$(ECHO) 'return_code=$$?' >> run_app.sh
	$(ECHO) 'if [ $$return_code -ne 0 ]; then' >> run_app.sh
	$(ECHO) 'echo "ERROR: host run failed, RC=$$return_code"' >> run_app.sh
	$(ECHO) 'fi' >> run_app.sh
	$(ECHO) 'echo "INFO: host run completed."' >> run_app.sh
endif

package: guard-ROOTFS guard-IMAGE guard-PLATFORM_REPO_PATHS package_${TARGET}
package_${TARGET}: ${LIBADF} ${BINARY_CONTAINERS} host gen_run_app
	${VCC} -p -t ${TARGET} -f ${PLATFORM} \
		--package.out_dir $(PACKAGE_OUT) \
		--package.rootfs ${ROOTFS} \
		--package.kernel_image ${IMAGE} \
		--package.boot_mode=sd \
		--package.image_format=ext4 \
		--package.defer_aie_run \
		--package.sd_file run_app.sh \
		--package.sd_file ${HOST_EXE} ${LIBADF} ${BINARY_CONTAINERS} -o ${FINAL_XCLBIN}
	@echo "COMPLETE: Package created."

run_hw_emu: launch_hw_emu.sh
launch_hw_emu.sh: package_hw_emu
	$(EMU_CMD)

clean:
	-$(RMDIR) $(HOST_EXE) $(XCLBIN)/{*sw_emu*,*hw_emu*} 
	-$(RMDIR) profile_* TempConfig system_estimate.xtxt *.rpt *.csv *.o *.xo *.xpe *.xsa cfg qemu_dts_files emu_qemu_scripts *.db sim  *.a 
	-$(RMDIR) aie/*.ll *v++* .Xil emconfig.json dltmp* xmltmp* *.log *.jou *.wcfg *.wdb *bin* *summary* *.BIN *.bif *.exe Work *.log *.txt 

cleanall: clean
	-$(RMDIR) build_dir* sd_card*
	-$(RMDIR) package.* run_app.sh 
	-$(RMDIR) _x* *xclbin.run_summary qemu-memory-_* emulation _vimage pl* start_simulation.sh *.xclbin
	$(MAKE) -C sw clean
