# Copyright (c) 2023 - 2024 Advanced Micro Devices, Inc. All Rights Reserved.
# SPDX-License-Identifier: MIT

include(${CMAKE_CURRENT_SOURCE_DIR}/common/StandaloneExample.cmake NO_POLICY_SCOPE)
if(("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa72")
        OR ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa78")
        OR ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa53")
        OR ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa53-32")
        OR ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "aarch64"))
    option(standalone_hypervisor_guest "Enable hypervisor guest for EL1 Nonsecure" OFF)
    set(XPAR_PS_INCLUDE "#include \"xparameters_ps.h\"")
    if(standalone_hypervisor_guest)
        set(EL1_NONSECURE " ")
        set(HYP_GUEST " ")
    else()
        set(EL3 " ")
    endif()
endif()

if("${CMAKE_MACHINE}" STREQUAL "ZynqMP")
    if(("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexr5")
        OR ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa53")
        OR ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa53-32"))
        option(standalone_zynqmp_fsbl_bsp "Disable or Enable Optimization for FSBL's BSP. ZynqMP FSBL will set this to true" OFF)
        option(standalone_clocking "Disable or Enable the clocking feature" OFF)
	if(standalone_zynqmp_fsbl_bsp)
            if ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa53")
		set(CMAKE_C_FLAGS " ${CMAKE_C_FLAGS} -Os -flto -ffat-lto-objects -DARMA53_64" CACHE STRING "CMAKE C FLAGS" FORCE)
		set(CMAKE_ASM_FLAGS " ${CMAKE_ASM_FLAGS} -Os -flto -ffat-lto-objects -DARMA53_64" CACHE STRING "CMAKE ASM FLAGS" FORCE)
	    elseif ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa53-32")
		set(CMAKE_C_FLAGS " ${CMAKE_C_FLAGS} -Os -flto -ffat-lto-objects -DARMA53_32 -march=armv7-a -mfpu=vfpv3 -mfloat-abi=hard" CACHE STRING "CMAKE C FLAGS" FORCE)
		set(CMAKE_ASM_FLAGS " ${CMAKE_ASM_FLAGS} -Os -flto -ffat-lto-objects -DARMA53_32 -march=armv7-a -mfpu=vfpv3 -mfloat-abi=hard" CACHE STRING "CMAKE ASM FLAGS" FORCE)
	    elseif ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexr5")
		set(CMAKE_C_FLAGS " ${CMAKE_C_FLAGS} -Os -flto -ffat-lto-objects -DARMR5" CACHE STRING "CMAKE C FLAGS" FORCE)
		set(CMAKE_ASM_FLAGS " ${CMAKE_ASM_FLAGS} -Os -flto -ffat-lto-objects -DARMR5" CACHE STRING "CMAKE ASM FLAGS" FORCE)
	    endif()
	elseif(standalone_clocking)
		set(CMAKE_C_FLAGS " ${CMAKE_C_FLAGS} -DXCLOCKING" CACHE STRING "CMAKE C FLAGS" FORCE)
	endif()
    endif()
endif()

if("${CMAKE_MACHINE}" STREQUAL "Versal")
    set(versal " ")
    set(VERSAL " ")
elseif("${CMAKE_MACHINE}" STREQUAL "VersalNet")
    set(versal " ")
    set(VERSAL_NET " ")
elseif("${CMAKE_MACHINE}" STREQUAL "ZynqMP")
    set(PLATFORM_ZYNQMP " ")
elseif("${CMAKE_MACHINE}" STREQUAL "Zynq")
    set(PLATFORM_ZYNQ " ")
endif()

if("${CMAKE_SUBMACHINE}" STREQUAL "VersalGen2")
    set(VERSAL_AIEPG2 " ")
endif()

if ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexr5")
	option(standalone_lockstep_mode_debug "Enable debug logic in non-JTAG boot mode, when Cortex R5 is configured in lockstep mode" OFF)
    if(standalone_lockstep_mode_debug)
	ADD_DEFINITIONS(-DLOCKSTEP_MODE_DEBUG=1)
    else()
	ADD_DEFINITIONS(-DLOCKSTEP_MODE_DEBUG=0)
    endif()

endif()

if(("${CMAKE_MACHINE}" STREQUAL "VersalNet") AND
   ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa78"))
    option(standalone_enable_minimal_xlat_tbl "Configures translation table only for initial 4 TB address space. Translation table size will be reduced by ~1 MB. It is applicable only for CortexA78 BSP. Enable it by default to fit executable in OCM memory, If users want to access peripheral/Memory mapped beyond 4 TB, it must be disabled." ON)
    if(standalone_enable_minimal_xlat_tbl)
        ADD_DEFINITIONS(-DENABLE_MINIMAL_XLAT_TBL)
    endif()
endif()

if(("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexr5")
    OR ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexr52"))
    set(XPAR_PS_INCLUDE "#include \"xparameters_ps.h\"")
endif()

if(("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "cortexa9"))
    set(XPAR_PS_INCLUDE "#include \"xparameters_ps.h\"")
endif()


if(("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "pmu_microblaze"))
    set(PSU_PMU 1)
elseif(("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "plm_microblaze"))
    set(VERSAL_PLM " ")
elseif(("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "microblaze"))
    set(PLATFORM_MB " ")
endif()

if(("${CMAKE_MACHINE}" STREQUAL "VersalNet") AND
   ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "plm_microblaze"))
    set(VERSALNET_PLM " ")
endif()

string(FIND "${CMAKE_C_FLAGS}" "-flto" has_flto)
if (${has_flto} EQUAL -1)
    set(XIL_INTERRUPT " ")
endif()

if (DEFINED XPAR_CPU_ID)
    set(CPU_ID_VAL ${XPAR_CPU_ID})
else()
    set(CPU_ID_VAL 0)
endif()
list(APPEND TOTAL_UART_INSTANCES ${UARTLITE_NUM_DRIVER_INSTANCES})
list(APPEND TOTAL_UART_INSTANCES ${UARTNS550_NUM_DRIVER_INSTANCES})
list(APPEND TOTAL_UART_INSTANCES ${UARTPS_NUM_DRIVER_INSTANCES})
list(APPEND TOTAL_UART_INSTANCES ${UARTPSV_NUM_DRIVER_INSTANCES})
list(APPEND TOTAL_UART_INSTANCES ${CORESIGHTPS_DCC_NUM_DRIVER_INSTANCES})
list(APPEND TOTAL_UART_INSTANCES ${IOMODULE_NUM_DRIVER_INSTANCES})

list(LENGTH UARTLITE_NUM_DRIVER_INSTANCES CONFIG_UARTLITE)
list(LENGTH UARTNS550_NUM_DRIVER_INSTANCES CONFIG_UARTNS550)
list(LENGTH UARTPS_NUM_DRIVER_INSTANCES CONFIG_UARTPS)
list(LENGTH UARTPSV_NUM_DRIVER_INSTANCES CONFIG_UARTPSV)
list(LENGTH CORESIGHTPS_DCC_NUM_DRIVER_INSTANCES CONFIG_CORESIGHTPS)
list(LENGTH IOMODULE_NUM_DRIVER_INSTANCES CONFIG_IOMODULE)

if (YOCTO OR
    (NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "FreeRTOS"))
set(standalone_stdin "None;" CACHE STRING "stdin peripheral")
SET_PROPERTY(CACHE standalone_stdin PROPERTY STRINGS "None;${TOTAL_UART_INSTANCES}")
set(standalone_stdout "None;" CACHE STRING "stdout peripheral")
SET_PROPERTY(CACHE standalone_stdout PROPERTY STRINGS "None;${TOTAL_UART_INSTANCES}")

if ("${standalone_stdin}" STREQUAL "None;")
    if (DEFINED STDIN_INSTANCE)
        if (${STDIN_INSTANCE} IN_LIST TOTAL_UART_INSTANCES)
	   set(standalone_stdin ${STDIN_INSTANCE} CACHE STRING "stdin peripheral" FORCE)
	   set(standalone_stdout ${STDIN_INSTANCE} CACHE STRING "stdout peripheral" FORCE)
        endif()
    else()
	if(${CONFIG_UARTPS})
	   list(GET UARTPS_NUM_DRIVER_INSTANCES 0 STDIN_INSTANCE)
	elseif(${CONFIG_UARTPSV})
	   list(GET UARTPSV_NUM_DRIVER_INSTANCES 0 STDIN_INSTANCE)
        elseif(${CONFIG_UARTLITE})
	   list(GET UARTLITE_NUM_DRIVER_INSTANCES 0 STDIN_INSTANCE)
	elseif(${CONFIG_UARTNS550})
	   list(GET UARTNS550_NUM_DRIVER_INSTANCES 0 STDIN_INSTANCE)
	elseif(${CONFIG_CORESIGHTPS})
	   list(GET CORESIGHTPS_DCC_NUM_DRIVER_INSTANCES 0 STDIN_INSTANCE)
	elseif(${CONFIG_IOMODULE})
	   list(GET IOMODULE_NUM_DRIVER_INSTANCES 0 STDIN_INSTANCE)
	endif()
	if (DEFINED STDIN_INSTANCE)
	   set(standalone_stdin ${STDIN_INSTANCE} CACHE STRING "stdin peripheral" FORCE)
	   set(standalone_stdout ${STDIN_INSTANCE} CACHE STRING "stdout peripheral" FORCE)
        endif()
    endif()
endif()

if (standalone_stdin IN_LIST UARTPS_NUM_DRIVER_INSTANCES)
    set(index 0)
    LIST_INDEX(${index} ${standalone_stdin} "${UARTPS_NUM_DRIVER_INSTANCES}")
    list(GET TOTAL_UARTPS_PROP_LIST ${index} reg)
    set(STDIN_BASEADDRESS  ${${reg}})
    set(STDOUT_BASEADDRESS  ${${reg}})
    set(XPAR_STDIN_IS_UARTPS " ")
elseif (standalone_stdin IN_LIST UARTPSV_NUM_DRIVER_INSTANCES)
    set(index 0)
    LIST_INDEX(${index} ${standalone_stdin} "${UARTPSV_NUM_DRIVER_INSTANCES}")
    list(GET TOTAL_UARTPSV_PROP_LIST ${index} reg)
    set(STDIN_BASEADDRESS  ${${reg}})
    set(STDOUT_BASEADDRESS  ${${reg}})
    set(XPAR_STDIN_IS_UARTPSV " ")
elseif (standalone_stdin IN_LIST UARTLITE_NUM_DRIVER_INSTANCES)
    set(index 0)
    LIST_INDEX(${index} ${standalone_stdin} "${UARTLITE_NUM_DRIVER_INSTANCES}")
    list(GET TOTAL_UARTLITE_PROP_LIST ${index} reg)
    set(STDIN_BASEADDRESS  ${${reg}})
    set(STDOUT_BASEADDRESS  ${${reg}})
    set(XPAR_STDIN_IS_UARTLITE " ")
elseif (standalone_stdin IN_LIST UARTNS550_NUM_DRIVER_INSTANCES)
    set(index 0)
    LIST_INDEX(${index} ${standalone_stdin} "${UARTNS550_NUM_DRIVER_INSTANCES}")
    list(GET TOTAL_UARTNS550_PROP_LIST ${index} reg)
    set(STDIN_BASEADDRESS  ${${reg}})
    set(STDOUT_BASEADDRESS  ${${reg}})
    set(XPAR_STDIN_IS_UARTNS550 " ")
elseif (standalone_stdin IN_LIST CORESIGHTPS_DCC_NUM_DRIVER_INSTANCES)
    set(index 0)
    LIST_INDEX(${index} ${standalone_stdin} "${CORESIGHTPS_DCC_NUM_DRIVER_INSTANCES}")
    list(GET TOTAL_CORESIGHTPS_DCC_PROP_LIST ${index} reg)
    set(STDIN_BASEADDRESS  ${${reg}})
    set(STDOUT_BASEADDRESS  ${${reg}})
    set(XPAR_STDIN_IS_CORESIGHTPS_DCC " ")
elseif (standalone_stdin IN_LIST IOMODULE_NUM_DRIVER_INSTANCES)
    set(index 0)
    LIST_INDEX(${index} ${standalone_stdin} "${IOMODULE_NUM_DRIVER_INSTANCES}")
    list(GET TOTAL_IOMODULE_PROP_LIST ${index} reg)
    set(STDIN_BASEADDRESS  ${${reg}})
    set(STDOUT_BASEADDRESS  ${${reg}})
    set(XPAR_STDIN_IS_IOMODULE " ")
endif()
else()
    set(FREERTOS_UARTCONFIG_INCLUDE "#include \"FreeRTOSUARTConfig.h\"")
endif()

set(standalone_microblaze_exceptions "None" CACHE STRING "Unused option and deprecated")
SET_PROPERTY(CACHE standalone_microblaze_exceptions PROPERTY STRINGS "None")
set(standalone_sleep_timer "None" CACHE STRING "Deprecated in favor of xiltimer")
SET_PROPERTY(CACHE standalone_sleep_timer PROPERTY STRINGS "None")
set(standalone_ttc_select_cntr "None" CACHE STRING "Deprecated in favor of xiltimer")
SET_PROPERTY(CACHE standalone_ttc_select_cntr PROPERTY STRINGS "None")
set(standalone_pmu_sleep_timer "None" CACHE STRING "Deprecated in favor of xiltimer")
SET_PROPERTY(CACHE standalone_pmu_sleep_timer PROPERTY STRINGS "None")
set(standalone_enable_sw_intrusive_profiling "None" CACHE STRING "This option is not supported in the Unified Vitis IDE in this version. Change to the classic IDE if you want to use this option")
SET_PROPERTY(CACHE standalone_enable_sw_intrusive_profiling PROPERTY STRINGS "None")
set(standalone_profile_timer "None" CACHE STRING "This option is not supported in the Unified Vitis IDE in this version. Change to the classic IDE if you want to use this option")
SET_PROPERTY(CACHE standalone_profile_timer PROPERTY STRINGS "None")
set(standalone_xpm_support "None" CACHE STRING "This option is not supported in the Unified Vitis IDE in this version. Change to the classic IDE if you want to use this option.")
SET_PROPERTY(CACHE standalone_xpm_support PROPERTY STRINGS "None")
# Processor CMake Cache entires
cmake_path(GET CMAKE_C_COMPILER_AR FILENAME compiler_ar)
set(proc_archiver ${compiler_ar} CACHE STRING "Archiver")
cmake_path(GET CMAKE_ASM_COMPILER FILENAME asm_compiler)
set(proc_assembler ${asm_compiler} CACHE STRING "Assembler")
cmake_path(GET CMAKE_C_COMPILER FILENAME compiler)
set(proc_compiler ${compiler} CACHE STRING "Compiler")
set(proc_compiler_flags ${TOOLCHAIN_C_FLAGS} "-c" CACHE STRING "Compiler Flags")
set(proc_extra_compiler_flags ${TOOLCHAIN_EXTRA_C_FLAGS} CACHE STRING "Extra Compiler Flags")

# If the PG flag is present, remove any references to it as BSP doesn't support the mcount API.
remove_pg()
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/bspconfig.h.in ${CMAKE_BINARY_DIR}/include/bspconfig.h)
