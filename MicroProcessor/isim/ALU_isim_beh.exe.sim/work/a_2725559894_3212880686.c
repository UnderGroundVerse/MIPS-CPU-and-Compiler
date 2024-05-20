/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/mo/Desktop/Project/MicroProcessor/ALU.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2725559894_3212880686_p_0(char *t0)
{
    char t14[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6120);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t5 = (t0 + 6123);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB9:    t8 = (t0 + 6126);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB10:    t11 = (t0 + 6129);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(67, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 3896);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast(t3);

LAB2:    t1 = (t0 + 3800);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(59, ng0);
    t15 = (t0 + 1352U);
    t16 = *((char **)t15);
    t15 = (t0 + 5976U);
    t17 = (t0 + 1512U);
    t18 = *((char **)t17);
    t17 = (t0 + 5976U);
    t19 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t14, t16, t15, t18, t17);
    t20 = (t14 + 12U);
    t21 = *((unsigned int *)t20);
    t22 = (1U * t21);
    t23 = (32U != t22);
    if (t23 == 1)
        goto LAB13;

LAB14:    t24 = (t0 + 3896);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t19, 32U);
    xsi_driver_first_trans_fast(t24);
    goto LAB2;

LAB4:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5976U);
    t3 = (t0 + 1512U);
    t5 = *((char **)t3);
    t3 = (t0 + 5976U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t14, t2, t1, t5, t3);
    t8 = (t14 + 12U);
    t21 = *((unsigned int *)t8);
    t22 = (1U * t21);
    t23 = (32U != t22);
    if (t23 == 1)
        goto LAB15;

LAB16:    t9 = (t0 + 3896);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB5:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5976U);
    t3 = (t0 + 1512U);
    t5 = *((char **)t3);
    t3 = (t0 + 5976U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t14, t2, t1, t5, t3);
    t8 = (t14 + 12U);
    t21 = *((unsigned int *)t8);
    t22 = (1U * t21);
    t23 = (32U != t22);
    if (t23 == 1)
        goto LAB17;

LAB18:    t9 = (t0 + 3896);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB6:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5976U);
    t3 = (t0 + 1512U);
    t5 = *((char **)t3);
    t3 = (t0 + 5976U);
    t6 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t14, t2, t1, t5, t3);
    t8 = (t14 + 12U);
    t21 = *((unsigned int *)t8);
    t22 = (1U * t21);
    t23 = (32U != t22);
    if (t23 == 1)
        goto LAB19;

LAB20:    t9 = (t0 + 3896);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB12:;
LAB13:    xsi_size_not_matching(32U, t22, 0);
    goto LAB14;

LAB15:    xsi_size_not_matching(32U, t22, 0);
    goto LAB16;

LAB17:    xsi_size_not_matching(32U, t22, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(32U, t22, 0);
    goto LAB20;

}

static void work_a_2725559894_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(70, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 3960);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3816);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2725559894_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2725559894_3212880686_p_0,(void *)work_a_2725559894_3212880686_p_1};
	xsi_register_didat("work_a_2725559894_3212880686", "isim/ALU_isim_beh.exe.sim/work/a_2725559894_3212880686.didat");
	xsi_register_executes(pe);
}
