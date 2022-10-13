/******************************************************************************
* Copyright (c) 2022 Xilinx, Inc.  All rights reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/*****************************************************************************/
/**
*
* @file fapu.h
*
* This file contains APU definitions used by PSM Firmware
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver	Who		Date		Changes
* ---- ---- -------- ------------------------------
* 1.00  sr   03/03/2022 Initial release
*
* </pre>
*
* @note
*
******************************************************************************/

#ifndef XPSMFW_APU_H_
#define XPSMFW_APU_H_

#ifdef __cplusplus
extern "C" {
#endif

#define APU_CLUSTER0_BASEADDR 0xECC00000U

/* APU reset vector address */
#define APU_CLUSTER0_RVBARADDR0L ( (APU_CLUSTER0_BASEADDR) + 0x00000040U)
#define APU_CLUSTER0_RVBARADDR0H ( (APU_CLUSTER0_BASEADDR) + 0x00000044U)
#define APU_CLUSTER0_RVBARADDR1L ( (APU_CLUSTER0_BASEADDR) + 0x00000048U)
#define APU_CLUSTER0_RVBARADDR1H ( (APU_CLUSTER0_BASEADDR) + 0x0000004CU)
#define APU_CLUSTER0_RVBARADDR2L ( (APU_CLUSTER0_BASEADDR) + 0x00000050U)
#define APU_CLUSTER0_RVBARADDR2H ( (APU_CLUSTER0_BASEADDR) + 0x00000054U)
#define APU_CLUSTER0_RVBARADDR3L ( (APU_CLUSTER0_BASEADDR) + 0x00000058U)
#define APU_CLUSTER0_RVBARADDR3H ( (APU_CLUSTER0_BASEADDR) + 0x0000005CU)

#define APU_CLUSTER1_BASEADDR 0xECD00000U

/* APU reset vector address */
#define APU_CLUSTER1_RVBARADDR0L ( (APU_CLUSTER1_BASEADDR) + 0x00000040U)
#define APU_CLUSTER1_RVBARADDR0H ( (APU_CLUSTER1_BASEADDR) + 0x00000044U)
#define APU_CLUSTER1_RVBARADDR1L ( (APU_CLUSTER1_BASEADDR) + 0x00000048U)
#define APU_CLUSTER1_RVBARADDR1H ( (APU_CLUSTER1_BASEADDR) + 0x0000004CU)
#define APU_CLUSTER1_RVBARADDR2L ( (APU_CLUSTER1_BASEADDR) + 0x00000050U)
#define APU_CLUSTER1_RVBARADDR2H ( (APU_CLUSTER1_BASEADDR) + 0x00000054U)
#define APU_CLUSTER1_RVBARADDR3L ( (APU_CLUSTER1_BASEADDR) + 0x00000058U)
#define APU_CLUSTER1_RVBARADDR3H ( (APU_CLUSTER1_BASEADDR) + 0x0000005CU)

#define APU_CLUSTER2_BASEADDR 0xECE00000U

/* APU2 reset vector address */
#define APU_CLUSTER2_RVBARADDR0L ( (APU_CLUSTER2_BASEADDR) + 0x00000040U)
#define APU_CLUSTER2_RVBARADDR0H ( (APU_CLUSTER2_BASEADDR) + 0x00000044U)
#define APU_CLUSTER2_RVBARADDR1L ( (APU_CLUSTER2_BASEADDR) + 0x00000048U)
#define APU_CLUSTER2_RVBARADDR1H ( (APU_CLUSTER2_BASEADDR) + 0x0000004CU)
#define APU_CLUSTER2_RVBARADDR2L ( (APU_CLUSTER2_BASEADDR) + 0x00000050U)
#define APU_CLUSTER2_RVBARADDR2H ( (APU_CLUSTER2_BASEADDR) + 0x00000054U)
#define APU_CLUSTER2_RVBARADDR3L ( (APU_CLUSTER2_BASEADDR) + 0x00000058U)
#define APU_CLUSTER2_RVBARADDR3H ( (APU_CLUSTER2_BASEADDR) + 0x0000005CU)

#define APU_CLUSTER3_BASEADDR 0xECF00000U

/* APU3 reset vector address */
#define APU_CLUSTER3_RVBARADDR0L ( (APU_CLUSTER3_BASEADDR) + 0x00000040U)
#define APU_CLUSTER3_RVBARADDR0H ( (APU_CLUSTER3_BASEADDR) + 0x00000044U)
#define APU_CLUSTER3_RVBARADDR1L ( (APU_CLUSTER3_BASEADDR) + 0x00000048U)
#define APU_CLUSTER3_RVBARADDR1H ( (APU_CLUSTER3_BASEADDR) + 0x0000004CU)
#define APU_CLUSTER3_RVBARADDR2L ( (APU_CLUSTER3_BASEADDR) + 0x00000050U)
#define APU_CLUSTER3_RVBARADDR2H ( (APU_CLUSTER3_BASEADDR) + 0x00000054U)
#define APU_CLUSTER3_RVBARADDR3L ( (APU_CLUSTER3_BASEADDR) + 0x00000058U)
#define APU_CLUSTER3_RVBARADDR3H ( (APU_CLUSTER3_BASEADDR) + 0x0000005CU)

#define APU_PCLI_BASEADDR 0xECB10000U

#define APU_PCLI_CLUSTER_0_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00008008U)
#define APU_PCLI_CLUSTER_0_PREQ  ( (APU_PCLI_BASEADDR) + 0x00008004U)
#define APU_PCLI_CLUSTER_0_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000800CU)
#define APU_PCLI_CLUSTER_1_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00009008U)
#define APU_PCLI_CLUSTER_1_PREQ  ( (APU_PCLI_BASEADDR) + 0x00009004U)
#define APU_PCLI_CLUSTER_1_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000900CU)
#define APU_PCLI_CLUSTER_2_PSTATE  ( (APU_PCLI_BASEADDR) + 0x0000A008U)
#define APU_PCLI_CLUSTER_2_PREQ  ( (APU_PCLI_BASEADDR) + 0x0000A004U)
#define APU_PCLI_CLUSTER_2_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000A00CU)
#define APU_PCLI_CLUSTER_3_PSTATE  ( (APU_PCLI_BASEADDR) + 0x0000B008U)
#define APU_PCLI_CLUSTER_3_PREQ  ( (APU_PCLI_BASEADDR) + 0x0000B004U)
#define APU_PCLI_CLUSTER_3_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000B00CU)

#define APU_PCLI_CORE_0_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000008U)
#define APU_PCLI_CORE_0_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000004U)
#define APU_PCLI_CORE_0_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000000CU)
#define APU_PCLI_CORE_1_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000038U)
#define APU_PCLI_CORE_1_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000034U)
#define APU_PCLI_CORE_1_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000003CU)
#define APU_PCLI_CORE_2_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000068U)
#define APU_PCLI_CORE_2_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000064U)
#define APU_PCLI_CORE_2_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000006CU)
#define APU_PCLI_CORE_3_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000098U)
#define APU_PCLI_CORE_3_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000094U)
#define APU_PCLI_CORE_3_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000009CU)

#define APU_PCLI_CORE_4_PSTATE  ( (APU_PCLI_BASEADDR) + 0x000000C8U)
#define APU_PCLI_CORE_4_PREQ  ( (APU_PCLI_BASEADDR) + 0x000000C4U)
#define APU_PCLI_CORE_4_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x000000CCU)
#define APU_PCLI_CORE_5_PSTATE  ( (APU_PCLI_BASEADDR) + 0x000000F8U)
#define APU_PCLI_CORE_5_PREQ  ( (APU_PCLI_BASEADDR) + 0x000000F4U)
#define APU_PCLI_CORE_5_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x000000FCU)
#define APU_PCLI_CORE_6_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000128U)
#define APU_PCLI_CORE_6_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000124U)
#define APU_PCLI_CORE_6_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000012CU)
#define APU_PCLI_CORE_7_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000158U)
#define APU_PCLI_CORE_7_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000154U)
#define APU_PCLI_CORE_7_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000015CU)
#define APU_PCLI_CORE_8_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000184U)
#define APU_PCLI_CORE_8_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000188U)
#define APU_PCLI_CORE_8_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000018CU)
#define APU_PCLI_CORE_9_PREQ  ( (APU_PCLI_BASEADDR) + 0x000001B4U)
#define APU_PCLI_CORE_9_PSTATE  ( (APU_PCLI_BASEADDR) + 0x000001B8U)
#define APU_PCLI_CORE_9_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x000001BCU)
#define APU_PCLI_CORE_10_PREQ  ( (APU_PCLI_BASEADDR) + 0x000001E4U)
#define APU_PCLI_CORE_10_PSTATE  ( (APU_PCLI_BASEADDR) + 0x000001E8U)
#define APU_PCLI_CORE_10_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x000001ECU)
#define APU_PCLI_CORE_11_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000214U)
#define APU_PCLI_CORE_11_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000218U)
#define APU_PCLI_CORE_11_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000021CU)
#define APU_PCLI_CORE_12_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000244U)
#define APU_PCLI_CORE_12_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000248U)
#define APU_PCLI_CORE_12_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000024CU)
#define APU_PCLI_CORE_13_PREQ  ( (APU_PCLI_BASEADDR) + 0x00000274U)
#define APU_PCLI_CORE_13_PSTATE  ( (APU_PCLI_BASEADDR) + 0x00000278U)
#define APU_PCLI_CORE_13_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x0000027CU)
#define APU_PCLI_CORE_14_PREQ  ( (APU_PCLI_BASEADDR) + 0x000002A4U)
#define APU_PCLI_CORE_14_PSTATE  ( (APU_PCLI_BASEADDR) + 0x000002A8U)
#define APU_PCLI_CORE_14_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x000002ACU)
#define APU_PCLI_CORE_15_PREQ  ( (APU_PCLI_BASEADDR) + 0x000002D4U)
#define APU_PCLI_CORE_15_PSTATE  ( (APU_PCLI_BASEADDR) + 0x000002D8U)
#define APU_PCLI_CORE_15_PACTIVE  ( (APU_PCLI_BASEADDR) + 0x000002DCU)

#define APU_PCLI_CLUSTER_PSTATE_MASK        ((u32)0x0000007FU)
#define APU_PCLI_CLUSTER_PSTATE_VAL        ((u32)0x00000048U)
#define APU_PCLI_CLUSTER_PREQ_MASK        ((u32)0x00000001U)
#define APU_PCLI_CLUSTER_PACCEPT_MASK        ((u32)0x01000000U)

#define APU_PCLI_CORE_PSTATE_MASK        ((u32)0x0000003FU)
#define APU_PCLI_CORE_PSTATE_VAL        ((u32)0x00000008U)
#define APU_PCLI_CORE_PREQ_MASK        ((u32)0x00000001U)
#define APU_PCLI_CORE_PACCEPT_MASK        ((u32)0x01000000U)

/**
 * CORESIGHT_APU0CORE0_DBG Base Address
 */
#define CORESIGHT_APU0CORE0_DBG_BASEADDR      (0xF0B40000U)
/**
 * Register: CORESIGHT_APU0CORE0_DBG_EDPRCR
 */
#define CORESIGHT_APU0CORE0_DBG_EDPRCR    ( ( CORESIGHT_APU0CORE0_DBG_BASEADDR ) + 0x00000310U )
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_FULLMASK     (0x0000000bU)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_FULLRWMASK  (0x00000009U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_DEFVAL   (0x0U)

#define CORESIGHT_APU0CORE0_DBG_EDPRCR_COREPURQ_SHIFT   (3U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_COREPURQ_WIDTH   (1U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_COREPURQ_MASK    (0x00000008U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_COREPURQ_DEFVAL  (0x0U)

#define CORESIGHT_APU0CORE0_DBG_EDPRCR_CWRR_SHIFT   (1U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_CWRR_WIDTH   (1U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_CWRR_MASK    (0x00000002U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_CWRR_DEFVAL  (0x0U)

#define CORESIGHT_APU0CORE0_DBG_EDPRCR_CORENPDRQ_SHIFT   (0U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_CORENPDRQ_WIDTH   (1U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_CORENPDRQ_MASK    (0x00000001U)
#define CORESIGHT_APU0CORE0_DBG_EDPRCR_CORENPDRQ_DEFVAL  (0x0U)

#ifdef __cplusplus
}
#endif

#endif /* XPSMFW_APU_H_ */