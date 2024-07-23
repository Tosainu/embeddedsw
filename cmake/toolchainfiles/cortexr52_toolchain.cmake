# Copyright (C) 2023-2024 Advanced Micro Devices, Inc.  All rights reserved.
# SPDX-License-Identifier: MIT
set( CMAKE_EXPORT_COMPILE_COMMANDS ON)
set( CMAKE_INSTALL_MESSAGE LAZY)
set( CMAKE_C_COMPILER armr5-none-eabi-gcc )
set( CMAKE_CXX_COMPILER armr5-none-eabi-g++ )
set( CMAKE_C_COMPILER_LAUNCHER  )
set( CMAKE_CXX_COMPILER_LAUNCHER  )
set( CMAKE_ASM_COMPILER armr5-none-eabi-gcc )
set( CMAKE_AR armr5-none-eabi-ar CACHE FILEPATH "Archiver" )
set( CMAKE_SIZE armr5-none-eabi-size CACHE FILEPATH "Size" )
set( CMAKE_SYSTEM_PROCESSOR "cortexr52" )
set( CMAKE_MACHINE "VersalNet" )
set( CMAKE_SUBMACHINE "VersalNet")
set( CMAKE_SYSTEM_NAME "Generic" )
set( CMAKE_SPECS_FILE "$ENV{ESW_REPO}/scripts/specs/arm/Xilinx.spec" CACHE STRING "Specs file path for using CMAKE toolchain files" )
set( FLAGS_SUFFIX "")
if(("${CMAKE_SUBMACHINE}" STREQUAL "VersalGen2"))
    set( FLAGS_SUFFIX -DVERSAL_AIEPG2)
endif()
set( TOOLCHAIN_C_FLAGS " -O2 -mcpu=cortex-r52 -DSDT -DARMR5 -DARMR52 -Dversal -DVERSAL_NET ${FLAGS_SUFFIX} -mfloat-abi=hard -mfpu=vfpv3-d16" CACHE STRING "CFLAGS" )
set( TOOLCHAIN_CXX_FLAGS " -O2 -mcpu=cortex-r52 -DSDT -DARMR5 -DARMR52 -Dversal -DVERSAL_NET ${FLAGS_SUFFIX} -mfloat-abi=hard -mfpu=vfpv3-d16" CACHE STRING "CXXFLAGS" )
set( TOOLCHAIN_ASM_FLAGS " -O2 -mcpu=cortex-r52 -DSDT -DARMR5 -DARMR52 -Dversal -DVERSAL_NET ${FLAGS_SUFFIX} -mfloat-abi=hard -mfpu=vfpv3-d16" CACHE STRING "ASM FLAGS" )
set( TOOLCHAIN_DEP_FLAGS " -MMD -MP" CACHE STRING "Flags used by compiler to generate dependency files")
set( TOOLCHAIN_EXTRA_C_FLAGS " -g -Wall -Wextra -fno-tree-loop-distribute-patterns" CACHE STRING "Extra CFLAGS")
set( CMAKE_C_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional CFLAGS for release" )
set( CMAKE_CXX_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional CXXFLAGS for release" )
set( CMAKE_ASM_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional ASM FLAGS for release" )
