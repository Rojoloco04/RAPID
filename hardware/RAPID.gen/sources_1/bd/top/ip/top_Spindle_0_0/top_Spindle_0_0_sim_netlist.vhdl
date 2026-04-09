-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Apr  9 17:32:00 2026
-- Host        : MDD-ECE-HP3853 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/jparrack/Desktop/RAPID/hardware/RAPID.gen/sources_1/bd/top/ip/top_Spindle_0_0/top_Spindle_0_0_sim_netlist.vhdl
-- Design      : top_Spindle_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_Spindle_0_0_Spindle is
  port (
    RPM_Out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    INHA : out STD_LOGIC;
    INHB : out STD_LOGIC;
    INLB : out STD_LOGIC;
    INLA : out STD_LOGIC;
    clk : in STD_LOGIC;
    RPM_Pulse_In : in STD_LOGIC;
    en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of top_Spindle_0_0_Spindle : entity is "Spindle";
end top_Spindle_0_0_Spindle;

architecture STRUCTURE of top_Spindle_0_0_Spindle is
  signal \^inhb\ : STD_LOGIC;
  signal INHB_i_1_n_0 : STD_LOGIC;
  signal \^inla\ : STD_LOGIC;
  signal INLA_i_1_n_0 : STD_LOGIC;
  signal \^inlb\ : STD_LOGIC;
  signal INLB_i_1_n_0 : STD_LOGIC;
  signal RPM_CLK_CNT0 : STD_LOGIC;
  signal \RPM_CLK_CNT[0]_i_2_n_0\ : STD_LOGIC;
  signal RPM_CLK_CNT_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \RPM_CLK_CNT_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \RPM_CLK_CNT_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \RPM_CLK_DIV[0]_i_3_n_0\ : STD_LOGIC;
  signal \RPM_CLK_DIV[0]_i_4_n_0\ : STD_LOGIC;
  signal \RPM_CLK_DIV[0]_i_5_n_0\ : STD_LOGIC;
  signal \RPM_CLK_DIV[0]_i_6_n_0\ : STD_LOGIC;
  signal RPM_CLK_DIV_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \RPM_CLK_DIV_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \RPM_CLK_DIV_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal RPM_PULSE_PREV : STD_LOGIC;
  signal \RPM_PULSE_REG_reg[2]_srl2_n_0\ : STD_LOGIC;
  signal \RPM_PULSE_REG_reg_n_0_[0]\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal clk_div : STD_LOGIC;
  signal clk_div_i_1_n_0 : STD_LOGIC;
  signal clk_div_i_2_n_0 : STD_LOGIC;
  signal clk_div_i_3_n_0 : STD_LOGIC;
  signal clk_div_i_4_n_0 : STD_LOGIC;
  signal clk_div_i_5_n_0 : STD_LOGIC;
  signal clk_div_i_6_n_0 : STD_LOGIC;
  signal counter : STD_LOGIC;
  signal \counter[0]_i_10_n_0\ : STD_LOGIC;
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter[0]_i_7_n_0\ : STD_LOGIC;
  signal \counter[0]_i_8_n_0\ : STD_LOGIC;
  signal \counter[0]_i_9_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 28 downto 0 );
  signal \counter_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal in_startup : STD_LOGIC;
  signal in_startup_i_1_n_0 : STD_LOGIC;
  signal in_startup_s1 : STD_LOGIC;
  signal in_startup_sync : STD_LOGIC;
  signal p_0_in8_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal \pwm_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_counter[0]_i_7_n_0\ : STD_LOGIC;
  signal pwm_counter_reg : STD_LOGIC_VECTOR ( 23 downto 3 );
  signal \pwm_counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal pwm_signal_i_1_n_0 : STD_LOGIC;
  signal pwm_signal_i_2_n_0 : STD_LOGIC;
  signal pwm_signal_i_3_n_0 : STD_LOGIC;
  signal pwm_signal_i_4_n_0 : STD_LOGIC;
  signal pwm_signal_i_5_n_0 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal start_check_i_1_n_0 : STD_LOGIC;
  signal start_check_reg_n_0 : STD_LOGIC;
  signal \start_count[0]_i_10_n_0\ : STD_LOGIC;
  signal \start_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \start_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \start_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \start_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \start_count[0]_i_7_n_0\ : STD_LOGIC;
  signal \start_count[0]_i_8_n_0\ : STD_LOGIC;
  signal \start_count[0]_i_9_n_0\ : STD_LOGIC;
  signal start_count_reg : STD_LOGIC_VECTOR ( 27 downto 5 );
  signal \start_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \start_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \start_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \start_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \start_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \start_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \start_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \start_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \start_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \start_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \start_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \start_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \start_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \start_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \start_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \start_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \start_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \start_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \start_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \start_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \start_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \start_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \start_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \start_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \start_count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \start_count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \start_count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \start_count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \start_count_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \start_count_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \start_count_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \start_count_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \start_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \start_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \start_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \start_count_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \start_count_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \start_count_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \start_count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \start_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \start_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \start_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \start_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \start_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \start_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \start_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \start_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \start_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \start_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \start_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \start_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \start_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \start_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \start_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \start_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \start_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \start_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \start_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \start_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \start_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \step[0]_i_1_n_0\ : STD_LOGIC;
  signal \step[1]_i_1_n_0\ : STD_LOGIC;
  signal \step[2]_i_1_n_0\ : STD_LOGIC;
  signal \step_reg_n_0_[0]\ : STD_LOGIC;
  signal \step_reg_n_0_[1]\ : STD_LOGIC;
  signal \step_reg_n_0_[2]\ : STD_LOGIC;
  signal \NLW_RPM_CLK_CNT_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_RPM_CLK_DIV_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_RPM_CLK_DIV_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_reg[28]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pwm_counter_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_start_count_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \RPM_CLK_CNT_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \RPM_CLK_CNT_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \RPM_CLK_CNT_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \RPM_CLK_CNT_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \RPM_CLK_DIV_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \RPM_CLK_DIV_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \RPM_CLK_DIV_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \RPM_CLK_DIV_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \RPM_CLK_DIV_reg[8]_i_1\ : label is 11;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \RPM_PULSE_REG_reg[2]_srl2\ : label is "\U0/RPM_PULSE_REG_reg ";
  attribute srl_name : string;
  attribute srl_name of \RPM_PULSE_REG_reg[2]_srl2\ : label is "\U0/RPM_PULSE_REG_reg[2]_srl2 ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk_div_i_4 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of clk_div_i_6 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[0]_i_10\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[0]_i_6\ : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of in_startup_i_1 : label is "soft_lutpair3";
  attribute ADDER_THRESHOLD of \pwm_counter_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of start_check_i_1 : label is "soft_lutpair3";
  attribute ADDER_THRESHOLD of \start_count_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \start_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \start_count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \start_count_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \start_count_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \start_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \start_count_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of \step[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \step[2]_i_1\ : label is "soft_lutpair0";
begin
  INHB <= \^inhb\;
  INLA <= \^inla\;
  INLB <= \^inlb\;
INHB_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA88A8A8AA88A88"
    )
        port map (
      I0 => en,
      I1 => in_startup_sync,
      I2 => \step_reg_n_0_[1]\,
      I3 => \step_reg_n_0_[0]\,
      I4 => \step_reg_n_0_[2]\,
      I5 => \^inhb\,
      O => INHB_i_1_n_0
    );
INHB_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_div,
      CE => '1',
      D => INHB_i_1_n_0,
      Q => \^inhb\,
      R => '0'
    );
INLA_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8AA88AA88AA88A8"
    )
        port map (
      I0 => en,
      I1 => in_startup_sync,
      I2 => \^inla\,
      I3 => \step_reg_n_0_[2]\,
      I4 => \step_reg_n_0_[0]\,
      I5 => \step_reg_n_0_[1]\,
      O => INLA_i_1_n_0
    );
INLA_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_div,
      CE => '1',
      D => INLA_i_1_n_0,
      Q => \^inla\,
      R => '0'
    );
INLB_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBC3200000000"
    )
        port map (
      I0 => \^inlb\,
      I1 => \step_reg_n_0_[1]\,
      I2 => \step_reg_n_0_[2]\,
      I3 => \step_reg_n_0_[0]\,
      I4 => in_startup_sync,
      I5 => en,
      O => INLB_i_1_n_0
    );
INLB_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_div,
      CE => '1',
      D => INLB_i_1_n_0,
      Q => \^inlb\,
      R => '0'
    );
\RPM_CLK_CNT[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RPM_CLK_CNT_reg(0),
      O => \RPM_CLK_CNT[0]_i_2_n_0\
    );
\RPM_CLK_CNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[0]_i_1_n_7\,
      Q => RPM_CLK_CNT_reg(0),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \RPM_CLK_CNT_reg[0]_i_1_n_0\,
      CO(2) => \RPM_CLK_CNT_reg[0]_i_1_n_1\,
      CO(1) => \RPM_CLK_CNT_reg[0]_i_1_n_2\,
      CO(0) => \RPM_CLK_CNT_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \RPM_CLK_CNT_reg[0]_i_1_n_4\,
      O(2) => \RPM_CLK_CNT_reg[0]_i_1_n_5\,
      O(1) => \RPM_CLK_CNT_reg[0]_i_1_n_6\,
      O(0) => \RPM_CLK_CNT_reg[0]_i_1_n_7\,
      S(3 downto 1) => RPM_CLK_CNT_reg(3 downto 1),
      S(0) => \RPM_CLK_CNT[0]_i_2_n_0\
    );
\RPM_CLK_CNT_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[8]_i_1_n_5\,
      Q => RPM_CLK_CNT_reg(10),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[8]_i_1_n_4\,
      Q => RPM_CLK_CNT_reg(11),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[12]_i_1_n_7\,
      Q => RPM_CLK_CNT_reg(12),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RPM_CLK_CNT_reg[8]_i_1_n_0\,
      CO(3) => \NLW_RPM_CLK_CNT_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \RPM_CLK_CNT_reg[12]_i_1_n_1\,
      CO(1) => \RPM_CLK_CNT_reg[12]_i_1_n_2\,
      CO(0) => \RPM_CLK_CNT_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \RPM_CLK_CNT_reg[12]_i_1_n_4\,
      O(2) => \RPM_CLK_CNT_reg[12]_i_1_n_5\,
      O(1) => \RPM_CLK_CNT_reg[12]_i_1_n_6\,
      O(0) => \RPM_CLK_CNT_reg[12]_i_1_n_7\,
      S(3 downto 0) => RPM_CLK_CNT_reg(15 downto 12)
    );
\RPM_CLK_CNT_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[12]_i_1_n_6\,
      Q => RPM_CLK_CNT_reg(13),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[12]_i_1_n_5\,
      Q => RPM_CLK_CNT_reg(14),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[12]_i_1_n_4\,
      Q => RPM_CLK_CNT_reg(15),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[0]_i_1_n_6\,
      Q => RPM_CLK_CNT_reg(1),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[0]_i_1_n_5\,
      Q => RPM_CLK_CNT_reg(2),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[0]_i_1_n_4\,
      Q => RPM_CLK_CNT_reg(3),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[4]_i_1_n_7\,
      Q => RPM_CLK_CNT_reg(4),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RPM_CLK_CNT_reg[0]_i_1_n_0\,
      CO(3) => \RPM_CLK_CNT_reg[4]_i_1_n_0\,
      CO(2) => \RPM_CLK_CNT_reg[4]_i_1_n_1\,
      CO(1) => \RPM_CLK_CNT_reg[4]_i_1_n_2\,
      CO(0) => \RPM_CLK_CNT_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \RPM_CLK_CNT_reg[4]_i_1_n_4\,
      O(2) => \RPM_CLK_CNT_reg[4]_i_1_n_5\,
      O(1) => \RPM_CLK_CNT_reg[4]_i_1_n_6\,
      O(0) => \RPM_CLK_CNT_reg[4]_i_1_n_7\,
      S(3 downto 0) => RPM_CLK_CNT_reg(7 downto 4)
    );
\RPM_CLK_CNT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[4]_i_1_n_6\,
      Q => RPM_CLK_CNT_reg(5),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[4]_i_1_n_5\,
      Q => RPM_CLK_CNT_reg(6),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[4]_i_1_n_4\,
      Q => RPM_CLK_CNT_reg(7),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[8]_i_1_n_7\,
      Q => RPM_CLK_CNT_reg(8),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_CNT_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RPM_CLK_CNT_reg[4]_i_1_n_0\,
      CO(3) => \RPM_CLK_CNT_reg[8]_i_1_n_0\,
      CO(2) => \RPM_CLK_CNT_reg[8]_i_1_n_1\,
      CO(1) => \RPM_CLK_CNT_reg[8]_i_1_n_2\,
      CO(0) => \RPM_CLK_CNT_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \RPM_CLK_CNT_reg[8]_i_1_n_4\,
      O(2) => \RPM_CLK_CNT_reg[8]_i_1_n_5\,
      O(1) => \RPM_CLK_CNT_reg[8]_i_1_n_6\,
      O(0) => \RPM_CLK_CNT_reg[8]_i_1_n_7\,
      S(3 downto 0) => RPM_CLK_CNT_reg(11 downto 8)
    );
\RPM_CLK_CNT_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \RPM_CLK_CNT_reg[8]_i_1_n_6\,
      Q => RPM_CLK_CNT_reg(9),
      R => RPM_CLK_CNT0
    );
\RPM_CLK_DIV[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFA888"
    )
        port map (
      I0 => RPM_CLK_DIV_reg(11),
      I1 => \RPM_CLK_DIV[0]_i_3_n_0\,
      I2 => RPM_CLK_DIV_reg(6),
      I3 => \RPM_CLK_DIV[0]_i_4_n_0\,
      I4 => RPM_CLK_DIV_reg(12),
      I5 => \RPM_CLK_DIV[0]_i_5_n_0\,
      O => sel
    );
\RPM_CLK_DIV[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => RPM_CLK_DIV_reg(8),
      I1 => RPM_CLK_DIV_reg(9),
      I2 => RPM_CLK_DIV_reg(7),
      I3 => RPM_CLK_DIV_reg(10),
      O => \RPM_CLK_DIV[0]_i_3_n_0\
    );
\RPM_CLK_DIV[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEFEFEFEFE"
    )
        port map (
      I0 => RPM_CLK_DIV_reg(4),
      I1 => RPM_CLK_DIV_reg(3),
      I2 => RPM_CLK_DIV_reg(5),
      I3 => RPM_CLK_DIV_reg(0),
      I4 => RPM_CLK_DIV_reg(2),
      I5 => RPM_CLK_DIV_reg(1),
      O => \RPM_CLK_DIV[0]_i_4_n_0\
    );
\RPM_CLK_DIV[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => RPM_CLK_DIV_reg(13),
      I1 => RPM_CLK_DIV_reg(14),
      I2 => RPM_CLK_DIV_reg(15),
      I3 => RPM_CLK_DIV_reg(16),
      O => \RPM_CLK_DIV[0]_i_5_n_0\
    );
\RPM_CLK_DIV[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RPM_CLK_DIV_reg(0),
      O => \RPM_CLK_DIV[0]_i_6_n_0\
    );
\RPM_CLK_DIV_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[0]_i_2_n_7\,
      Q => RPM_CLK_DIV_reg(0),
      R => sel
    );
\RPM_CLK_DIV_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \RPM_CLK_DIV_reg[0]_i_2_n_0\,
      CO(2) => \RPM_CLK_DIV_reg[0]_i_2_n_1\,
      CO(1) => \RPM_CLK_DIV_reg[0]_i_2_n_2\,
      CO(0) => \RPM_CLK_DIV_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \RPM_CLK_DIV_reg[0]_i_2_n_4\,
      O(2) => \RPM_CLK_DIV_reg[0]_i_2_n_5\,
      O(1) => \RPM_CLK_DIV_reg[0]_i_2_n_6\,
      O(0) => \RPM_CLK_DIV_reg[0]_i_2_n_7\,
      S(3 downto 1) => RPM_CLK_DIV_reg(3 downto 1),
      S(0) => \RPM_CLK_DIV[0]_i_6_n_0\
    );
\RPM_CLK_DIV_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[8]_i_1_n_5\,
      Q => RPM_CLK_DIV_reg(10),
      R => sel
    );
\RPM_CLK_DIV_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[8]_i_1_n_4\,
      Q => RPM_CLK_DIV_reg(11),
      R => sel
    );
\RPM_CLK_DIV_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[12]_i_1_n_7\,
      Q => RPM_CLK_DIV_reg(12),
      R => sel
    );
\RPM_CLK_DIV_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RPM_CLK_DIV_reg[8]_i_1_n_0\,
      CO(3) => \RPM_CLK_DIV_reg[12]_i_1_n_0\,
      CO(2) => \RPM_CLK_DIV_reg[12]_i_1_n_1\,
      CO(1) => \RPM_CLK_DIV_reg[12]_i_1_n_2\,
      CO(0) => \RPM_CLK_DIV_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \RPM_CLK_DIV_reg[12]_i_1_n_4\,
      O(2) => \RPM_CLK_DIV_reg[12]_i_1_n_5\,
      O(1) => \RPM_CLK_DIV_reg[12]_i_1_n_6\,
      O(0) => \RPM_CLK_DIV_reg[12]_i_1_n_7\,
      S(3 downto 0) => RPM_CLK_DIV_reg(15 downto 12)
    );
\RPM_CLK_DIV_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[12]_i_1_n_6\,
      Q => RPM_CLK_DIV_reg(13),
      R => sel
    );
\RPM_CLK_DIV_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[12]_i_1_n_5\,
      Q => RPM_CLK_DIV_reg(14),
      R => sel
    );
\RPM_CLK_DIV_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[12]_i_1_n_4\,
      Q => RPM_CLK_DIV_reg(15),
      R => sel
    );
\RPM_CLK_DIV_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[16]_i_1_n_7\,
      Q => RPM_CLK_DIV_reg(16),
      R => sel
    );
\RPM_CLK_DIV_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RPM_CLK_DIV_reg[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_RPM_CLK_DIV_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_RPM_CLK_DIV_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \RPM_CLK_DIV_reg[16]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => RPM_CLK_DIV_reg(16)
    );
\RPM_CLK_DIV_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[0]_i_2_n_6\,
      Q => RPM_CLK_DIV_reg(1),
      R => sel
    );
\RPM_CLK_DIV_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[0]_i_2_n_5\,
      Q => RPM_CLK_DIV_reg(2),
      R => sel
    );
\RPM_CLK_DIV_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[0]_i_2_n_4\,
      Q => RPM_CLK_DIV_reg(3),
      R => sel
    );
\RPM_CLK_DIV_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[4]_i_1_n_7\,
      Q => RPM_CLK_DIV_reg(4),
      R => sel
    );
\RPM_CLK_DIV_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RPM_CLK_DIV_reg[0]_i_2_n_0\,
      CO(3) => \RPM_CLK_DIV_reg[4]_i_1_n_0\,
      CO(2) => \RPM_CLK_DIV_reg[4]_i_1_n_1\,
      CO(1) => \RPM_CLK_DIV_reg[4]_i_1_n_2\,
      CO(0) => \RPM_CLK_DIV_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \RPM_CLK_DIV_reg[4]_i_1_n_4\,
      O(2) => \RPM_CLK_DIV_reg[4]_i_1_n_5\,
      O(1) => \RPM_CLK_DIV_reg[4]_i_1_n_6\,
      O(0) => \RPM_CLK_DIV_reg[4]_i_1_n_7\,
      S(3 downto 0) => RPM_CLK_DIV_reg(7 downto 4)
    );
\RPM_CLK_DIV_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[4]_i_1_n_6\,
      Q => RPM_CLK_DIV_reg(5),
      R => sel
    );
\RPM_CLK_DIV_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[4]_i_1_n_5\,
      Q => RPM_CLK_DIV_reg(6),
      R => sel
    );
\RPM_CLK_DIV_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[4]_i_1_n_4\,
      Q => RPM_CLK_DIV_reg(7),
      R => sel
    );
\RPM_CLK_DIV_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[8]_i_1_n_7\,
      Q => RPM_CLK_DIV_reg(8),
      R => sel
    );
\RPM_CLK_DIV_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \RPM_CLK_DIV_reg[4]_i_1_n_0\,
      CO(3) => \RPM_CLK_DIV_reg[8]_i_1_n_0\,
      CO(2) => \RPM_CLK_DIV_reg[8]_i_1_n_1\,
      CO(1) => \RPM_CLK_DIV_reg[8]_i_1_n_2\,
      CO(0) => \RPM_CLK_DIV_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \RPM_CLK_DIV_reg[8]_i_1_n_4\,
      O(2) => \RPM_CLK_DIV_reg[8]_i_1_n_5\,
      O(1) => \RPM_CLK_DIV_reg[8]_i_1_n_6\,
      O(0) => \RPM_CLK_DIV_reg[8]_i_1_n_7\,
      S(3 downto 0) => RPM_CLK_DIV_reg(11 downto 8)
    );
\RPM_CLK_DIV_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \RPM_CLK_DIV_reg[8]_i_1_n_6\,
      Q => RPM_CLK_DIV_reg(9),
      R => sel
    );
\RPM_OUT_SIG[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => RPM_PULSE_PREV,
      O => RPM_CLK_CNT0
    );
\RPM_OUT_SIG_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(0),
      Q => RPM_Out(0),
      R => '0'
    );
\RPM_OUT_SIG_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(10),
      Q => RPM_Out(10),
      R => '0'
    );
\RPM_OUT_SIG_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(11),
      Q => RPM_Out(11),
      R => '0'
    );
\RPM_OUT_SIG_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(12),
      Q => RPM_Out(12),
      R => '0'
    );
\RPM_OUT_SIG_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(13),
      Q => RPM_Out(13),
      R => '0'
    );
\RPM_OUT_SIG_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(14),
      Q => RPM_Out(14),
      R => '0'
    );
\RPM_OUT_SIG_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(15),
      Q => RPM_Out(15),
      R => '0'
    );
\RPM_OUT_SIG_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(1),
      Q => RPM_Out(1),
      R => '0'
    );
\RPM_OUT_SIG_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(2),
      Q => RPM_Out(2),
      R => '0'
    );
\RPM_OUT_SIG_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(3),
      Q => RPM_Out(3),
      R => '0'
    );
\RPM_OUT_SIG_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(4),
      Q => RPM_Out(4),
      R => '0'
    );
\RPM_OUT_SIG_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(5),
      Q => RPM_Out(5),
      R => '0'
    );
\RPM_OUT_SIG_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(6),
      Q => RPM_Out(6),
      R => '0'
    );
\RPM_OUT_SIG_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(7),
      Q => RPM_Out(7),
      R => '0'
    );
\RPM_OUT_SIG_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(8),
      Q => RPM_Out(8),
      R => '0'
    );
\RPM_OUT_SIG_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => RPM_CLK_CNT0,
      D => RPM_CLK_CNT_reg(9),
      Q => RPM_Out(9),
      R => '0'
    );
RPM_PULSE_PREV_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in8_in,
      Q => RPM_PULSE_PREV,
      R => '0'
    );
\RPM_PULSE_REG_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => RPM_Pulse_In,
      Q => \RPM_PULSE_REG_reg_n_0_[0]\,
      R => '0'
    );
\RPM_PULSE_REG_reg[2]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \RPM_PULSE_REG_reg_n_0_[0]\,
      Q => \RPM_PULSE_REG_reg[2]_srl2_n_0\
    );
\RPM_PULSE_REG_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \RPM_PULSE_REG_reg[2]_srl2_n_0\,
      Q => p_0_in8_in,
      R => '0'
    );
clk_div_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter[0]_i_2_n_0\,
      I1 => clk_div_i_2_n_0,
      O => clk_div_i_1_n_0
    );
clk_div_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000011115515"
    )
        port map (
      I0 => \counter[0]_i_4_n_0\,
      I1 => counter_reg(22),
      I2 => clk_div_i_3_n_0,
      I3 => clk_div_i_4_n_0,
      I4 => counter_reg(21),
      I5 => counter_reg(23),
      O => clk_div_i_2_n_0
    );
clk_div_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAAEAAAAAAAA"
    )
        port map (
      I0 => counter_reg(15),
      I1 => counter_reg(10),
      I2 => clk_div_i_5_n_0,
      I3 => clk_div_i_6_n_0,
      I4 => counter_reg(13),
      I5 => counter_reg(14),
      O => clk_div_i_3_n_0
    );
clk_div_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => counter_reg(20),
      I1 => counter_reg(19),
      I2 => counter_reg(18),
      I3 => counter_reg(17),
      I4 => counter_reg(16),
      O => clk_div_i_4_n_0
    );
clk_div_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => counter_reg(8),
      I1 => counter_reg(7),
      I2 => counter_reg(6),
      I3 => counter_reg(5),
      I4 => counter_reg(4),
      O => clk_div_i_5_n_0
    );
clk_div_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => counter_reg(11),
      I1 => counter_reg(12),
      I2 => counter_reg(9),
      O => clk_div_i_6_n_0
    );
clk_div_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => clk_div_i_1_n_0,
      Q => clk_div,
      R => '0'
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter[0]_i_2_n_0\,
      O => counter
    );
\counter[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter_reg(11),
      I1 => counter_reg(12),
      I2 => counter_reg(10),
      I3 => counter_reg(13),
      O => \counter[0]_i_10_n_0\
    );
\counter[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000515555555555"
    )
        port map (
      I0 => \counter[0]_i_4_n_0\,
      I1 => \counter[0]_i_5_n_0\,
      I2 => \counter[0]_i_6_n_0\,
      I3 => counter_reg(21),
      I4 => counter_reg(22),
      I5 => counter_reg(23),
      O => \counter[0]_i_2_n_0\
    );
\counter[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => counter_reg(24),
      I1 => counter_reg(26),
      I2 => counter_reg(25),
      I3 => counter_reg(28),
      I4 => counter_reg(27),
      O => \counter[0]_i_4_n_0\
    );
\counter[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAFEAAAAAAAA"
    )
        port map (
      I0 => counter_reg(16),
      I1 => \counter[0]_i_8_n_0\,
      I2 => \counter[0]_i_9_n_0\,
      I3 => \counter[0]_i_10_n_0\,
      I4 => counter_reg(14),
      I5 => counter_reg(15),
      O => \counter[0]_i_5_n_0\
    );
\counter[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter_reg(17),
      I1 => counter_reg(18),
      I2 => counter_reg(19),
      I3 => counter_reg(20),
      O => \counter[0]_i_6_n_0\
    );
\counter[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_7_n_0\
    );
\counter[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
        port map (
      I0 => counter_reg(5),
      I1 => counter_reg(2),
      I2 => counter_reg(3),
      I3 => counter_reg(0),
      I4 => counter_reg(4),
      I5 => counter_reg(1),
      O => \counter[0]_i_8_n_0\
    );
\counter[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(8),
      I2 => counter_reg(7),
      I3 => counter_reg(6),
      O => \counter[0]_i_9_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[0]_i_3_n_7\,
      Q => counter_reg(0),
      R => counter
    );
\counter_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_3_n_0\,
      CO(2) => \counter_reg[0]_i_3_n_1\,
      CO(1) => \counter_reg[0]_i_3_n_2\,
      CO(0) => \counter_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_3_n_4\,
      O(2) => \counter_reg[0]_i_3_n_5\,
      O(1) => \counter_reg[0]_i_3_n_6\,
      O(0) => \counter_reg[0]_i_3_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_7_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => counter
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => counter
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => counter
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => counter
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => counter
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => counter
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => counter
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => counter
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => counter
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => counter
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[0]_i_3_n_6\,
      Q => counter_reg(1),
      R => counter
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => counter
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => counter
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => counter
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => counter
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[24]_i_1_n_7\,
      Q => counter_reg(24),
      R => counter
    );
\counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3) => \counter_reg[24]_i_1_n_0\,
      CO(2) => \counter_reg[24]_i_1_n_1\,
      CO(1) => \counter_reg[24]_i_1_n_2\,
      CO(0) => \counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[24]_i_1_n_4\,
      O(2) => \counter_reg[24]_i_1_n_5\,
      O(1) => \counter_reg[24]_i_1_n_6\,
      O(0) => \counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => counter_reg(27 downto 24)
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[24]_i_1_n_6\,
      Q => counter_reg(25),
      R => counter
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[24]_i_1_n_5\,
      Q => counter_reg(26),
      R => counter
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[24]_i_1_n_4\,
      Q => counter_reg(27),
      R => counter
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[28]_i_1_n_7\,
      Q => counter_reg(28),
      R => counter
    );
\counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[24]_i_1_n_0\,
      CO(3 downto 0) => \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_counter_reg[28]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \counter_reg[28]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => counter_reg(28)
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[0]_i_3_n_5\,
      Q => counter_reg(2),
      R => counter
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[0]_i_3_n_4\,
      Q => counter_reg(3),
      R => counter
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => counter
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_3_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => counter
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => counter
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => counter
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => counter
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[0]_i_2_n_0\,
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => counter
    );
in_startup_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => in_startup,
      I1 => start_check_reg_n_0,
      I2 => p_1_in,
      I3 => en,
      O => in_startup_i_1_n_0
    );
in_startup_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => in_startup_i_1_n_0,
      Q => in_startup,
      R => '0'
    );
in_startup_s1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_div,
      CE => '1',
      D => in_startup,
      Q => in_startup_s1,
      R => '0'
    );
in_startup_sync_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_div,
      CE => '1',
      D => in_startup_s1,
      Q => in_startup_sync,
      R => '0'
    );
\pwm_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A8A8A8A8A8A8A88"
    )
        port map (
      I0 => pwm_counter_reg(23),
      I1 => pwm_counter_reg(22),
      I2 => \pwm_counter[0]_i_3_n_0\,
      I3 => pwm_counter_reg(16),
      I4 => \pwm_counter[0]_i_4_n_0\,
      I5 => \pwm_counter[0]_i_5_n_0\,
      O => clear
    );
\pwm_counter[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => pwm_counter_reg(19),
      I1 => pwm_counter_reg(21),
      I2 => pwm_counter_reg(20),
      I3 => pwm_counter_reg(17),
      I4 => pwm_counter_reg(18),
      O => \pwm_counter[0]_i_3_n_0\
    );
\pwm_counter[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => pwm_counter_reg(14),
      I1 => pwm_counter_reg(15),
      O => \pwm_counter[0]_i_4_n_0\
    );
\pwm_counter[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFE"
    )
        port map (
      I0 => pwm_counter_reg(6),
      I1 => pwm_counter_reg(5),
      I2 => pwm_counter_reg(8),
      I3 => pwm_counter_reg(7),
      I4 => pwm_counter_reg(9),
      I5 => \pwm_counter[0]_i_7_n_0\,
      O => \pwm_counter[0]_i_5_n_0\
    );
\pwm_counter[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \pwm_counter_reg_n_0_[0]\,
      O => \pwm_counter[0]_i_6_n_0\
    );
\pwm_counter[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => pwm_counter_reg(11),
      I1 => pwm_counter_reg(12),
      I2 => pwm_counter_reg(13),
      I3 => pwm_counter_reg(15),
      I4 => pwm_counter_reg(10),
      O => \pwm_counter[0]_i_7_n_0\
    );
\pwm_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[0]_i_2_n_7\,
      Q => \pwm_counter_reg_n_0_[0]\,
      R => clear
    );
\pwm_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pwm_counter_reg[0]_i_2_n_0\,
      CO(2) => \pwm_counter_reg[0]_i_2_n_1\,
      CO(1) => \pwm_counter_reg[0]_i_2_n_2\,
      CO(0) => \pwm_counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \pwm_counter_reg[0]_i_2_n_4\,
      O(2) => \pwm_counter_reg[0]_i_2_n_5\,
      O(1) => \pwm_counter_reg[0]_i_2_n_6\,
      O(0) => \pwm_counter_reg[0]_i_2_n_7\,
      S(3) => pwm_counter_reg(3),
      S(2) => \pwm_counter_reg_n_0_[2]\,
      S(1) => \pwm_counter_reg_n_0_[1]\,
      S(0) => \pwm_counter[0]_i_6_n_0\
    );
\pwm_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[8]_i_1_n_5\,
      Q => pwm_counter_reg(10),
      R => clear
    );
\pwm_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[8]_i_1_n_4\,
      Q => pwm_counter_reg(11),
      R => clear
    );
\pwm_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[12]_i_1_n_7\,
      Q => pwm_counter_reg(12),
      R => clear
    );
\pwm_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[8]_i_1_n_0\,
      CO(3) => \pwm_counter_reg[12]_i_1_n_0\,
      CO(2) => \pwm_counter_reg[12]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[12]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[12]_i_1_n_4\,
      O(2) => \pwm_counter_reg[12]_i_1_n_5\,
      O(1) => \pwm_counter_reg[12]_i_1_n_6\,
      O(0) => \pwm_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => pwm_counter_reg(15 downto 12)
    );
\pwm_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[12]_i_1_n_6\,
      Q => pwm_counter_reg(13),
      R => clear
    );
\pwm_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[12]_i_1_n_5\,
      Q => pwm_counter_reg(14),
      R => clear
    );
\pwm_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[12]_i_1_n_4\,
      Q => pwm_counter_reg(15),
      R => clear
    );
\pwm_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[16]_i_1_n_7\,
      Q => pwm_counter_reg(16),
      R => clear
    );
\pwm_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[12]_i_1_n_0\,
      CO(3) => \pwm_counter_reg[16]_i_1_n_0\,
      CO(2) => \pwm_counter_reg[16]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[16]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[16]_i_1_n_4\,
      O(2) => \pwm_counter_reg[16]_i_1_n_5\,
      O(1) => \pwm_counter_reg[16]_i_1_n_6\,
      O(0) => \pwm_counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => pwm_counter_reg(19 downto 16)
    );
\pwm_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[16]_i_1_n_6\,
      Q => pwm_counter_reg(17),
      R => clear
    );
\pwm_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[16]_i_1_n_5\,
      Q => pwm_counter_reg(18),
      R => clear
    );
\pwm_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[16]_i_1_n_4\,
      Q => pwm_counter_reg(19),
      R => clear
    );
\pwm_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[0]_i_2_n_6\,
      Q => \pwm_counter_reg_n_0_[1]\,
      R => clear
    );
\pwm_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[20]_i_1_n_7\,
      Q => pwm_counter_reg(20),
      R => clear
    );
\pwm_counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[16]_i_1_n_0\,
      CO(3) => \NLW_pwm_counter_reg[20]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pwm_counter_reg[20]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[20]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[20]_i_1_n_4\,
      O(2) => \pwm_counter_reg[20]_i_1_n_5\,
      O(1) => \pwm_counter_reg[20]_i_1_n_6\,
      O(0) => \pwm_counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => pwm_counter_reg(23 downto 20)
    );
\pwm_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[20]_i_1_n_6\,
      Q => pwm_counter_reg(21),
      R => clear
    );
\pwm_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[20]_i_1_n_5\,
      Q => pwm_counter_reg(22),
      R => clear
    );
\pwm_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[20]_i_1_n_4\,
      Q => pwm_counter_reg(23),
      R => clear
    );
\pwm_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[0]_i_2_n_5\,
      Q => \pwm_counter_reg_n_0_[2]\,
      R => clear
    );
\pwm_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[0]_i_2_n_4\,
      Q => pwm_counter_reg(3),
      R => clear
    );
\pwm_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[4]_i_1_n_7\,
      Q => pwm_counter_reg(4),
      R => clear
    );
\pwm_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[0]_i_2_n_0\,
      CO(3) => \pwm_counter_reg[4]_i_1_n_0\,
      CO(2) => \pwm_counter_reg[4]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[4]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[4]_i_1_n_4\,
      O(2) => \pwm_counter_reg[4]_i_1_n_5\,
      O(1) => \pwm_counter_reg[4]_i_1_n_6\,
      O(0) => \pwm_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => pwm_counter_reg(7 downto 4)
    );
\pwm_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[4]_i_1_n_6\,
      Q => pwm_counter_reg(5),
      R => clear
    );
\pwm_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[4]_i_1_n_5\,
      Q => pwm_counter_reg(6),
      R => clear
    );
\pwm_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[4]_i_1_n_4\,
      Q => pwm_counter_reg(7),
      R => clear
    );
\pwm_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[8]_i_1_n_7\,
      Q => pwm_counter_reg(8),
      R => clear
    );
\pwm_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[4]_i_1_n_0\,
      CO(3) => \pwm_counter_reg[8]_i_1_n_0\,
      CO(2) => \pwm_counter_reg[8]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[8]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[8]_i_1_n_4\,
      O(2) => \pwm_counter_reg[8]_i_1_n_5\,
      O(1) => \pwm_counter_reg[8]_i_1_n_6\,
      O(0) => \pwm_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => pwm_counter_reg(11 downto 8)
    );
\pwm_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \pwm_counter_reg[8]_i_1_n_6\,
      Q => pwm_counter_reg(9),
      R => clear
    );
pwm_signal_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => pwm_signal_i_2_n_0,
      I1 => pwm_signal_i_3_n_0,
      I2 => pwm_counter_reg(20),
      I3 => pwm_counter_reg(17),
      I4 => pwm_counter_reg(19),
      O => pwm_signal_i_1_n_0
    );
pwm_signal_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"45FFFFFFFFFFFFFF"
    )
        port map (
      I0 => pwm_counter_reg(12),
      I1 => pwm_signal_i_4_n_0,
      I2 => pwm_counter_reg(11),
      I3 => pwm_counter_reg(13),
      I4 => pwm_counter_reg(16),
      I5 => \pwm_counter[0]_i_4_n_0\,
      O => pwm_signal_i_2_n_0
    );
pwm_signal_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pwm_counter_reg(23),
      I1 => pwm_counter_reg(22),
      I2 => pwm_counter_reg(18),
      I3 => pwm_counter_reg(21),
      O => pwm_signal_i_3_n_0
    );
pwm_signal_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000001FF"
    )
        port map (
      I0 => pwm_counter_reg(3),
      I1 => pwm_counter_reg(4),
      I2 => pwm_counter_reg(5),
      I3 => pwm_counter_reg(6),
      I4 => pwm_signal_i_5_n_0,
      I5 => pwm_counter_reg(10),
      O => pwm_signal_i_4_n_0
    );
pwm_signal_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => pwm_counter_reg(8),
      I1 => pwm_counter_reg(7),
      I2 => pwm_counter_reg(9),
      O => pwm_signal_i_5_n_0
    );
pwm_signal_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => pwm_signal_i_1_n_0,
      Q => INHA,
      R => '0'
    );
start_check_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => start_check_reg_n_0,
      I1 => p_1_in,
      I2 => en,
      O => start_check_i_1_n_0
    );
start_check_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => start_check_i_1_n_0,
      Q => start_check_reg_n_0,
      R => '0'
    );
\start_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => p_1_in,
      I1 => start_check_reg_n_0,
      I2 => en,
      O => \start_count[0]_i_1_n_0\
    );
\start_count[0]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => start_count_reg(19),
      I1 => start_count_reg(18),
      O => \start_count[0]_i_10_n_0\
    );
\start_count[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555FFFF7757"
    )
        port map (
      I0 => start_count_reg(27),
      I1 => \start_count[0]_i_5_n_0\,
      I2 => start_count_reg(21),
      I3 => \start_count[0]_i_6_n_0\,
      I4 => \start_count[0]_i_7_n_0\,
      I5 => start_count_reg(26),
      O => p_1_in
    );
\start_count[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \start_count_reg_n_0_[0]\,
      O => \start_count[0]_i_4_n_0\
    );
\start_count[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => start_count_reg(23),
      I1 => start_count_reg(22),
      O => \start_count[0]_i_5_n_0\
    );
\start_count[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF0455"
    )
        port map (
      I0 => start_count_reg(17),
      I1 => \start_count[0]_i_8_n_0\,
      I2 => \start_count[0]_i_9_n_0\,
      I3 => start_count_reg(16),
      I4 => \start_count[0]_i_10_n_0\,
      I5 => start_count_reg(20),
      O => \start_count[0]_i_6_n_0\
    );
\start_count[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => start_count_reg(25),
      I1 => start_count_reg(24),
      O => \start_count[0]_i_7_n_0\
    );
\start_count[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555555557FFFFFFF"
    )
        port map (
      I0 => start_count_reg(10),
      I1 => start_count_reg(5),
      I2 => start_count_reg(8),
      I3 => start_count_reg(6),
      I4 => start_count_reg(7),
      I5 => start_count_reg(9),
      O => \start_count[0]_i_8_n_0\
    );
\start_count[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => start_count_reg(13),
      I1 => start_count_reg(15),
      I2 => start_count_reg(12),
      I3 => start_count_reg(11),
      I4 => start_count_reg(14),
      O => \start_count[0]_i_9_n_0\
    );
\start_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[0]_i_2_n_7\,
      Q => \start_count_reg_n_0_[0]\,
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \start_count_reg[0]_i_2_n_0\,
      CO(2) => \start_count_reg[0]_i_2_n_1\,
      CO(1) => \start_count_reg[0]_i_2_n_2\,
      CO(0) => \start_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \start_count_reg[0]_i_2_n_4\,
      O(2) => \start_count_reg[0]_i_2_n_5\,
      O(1) => \start_count_reg[0]_i_2_n_6\,
      O(0) => \start_count_reg[0]_i_2_n_7\,
      S(3) => \start_count_reg_n_0_[3]\,
      S(2) => \start_count_reg_n_0_[2]\,
      S(1) => \start_count_reg_n_0_[1]\,
      S(0) => \start_count[0]_i_4_n_0\
    );
\start_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[8]_i_1_n_5\,
      Q => start_count_reg(10),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[8]_i_1_n_4\,
      Q => start_count_reg(11),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[12]_i_1_n_7\,
      Q => start_count_reg(12),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \start_count_reg[8]_i_1_n_0\,
      CO(3) => \start_count_reg[12]_i_1_n_0\,
      CO(2) => \start_count_reg[12]_i_1_n_1\,
      CO(1) => \start_count_reg[12]_i_1_n_2\,
      CO(0) => \start_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \start_count_reg[12]_i_1_n_4\,
      O(2) => \start_count_reg[12]_i_1_n_5\,
      O(1) => \start_count_reg[12]_i_1_n_6\,
      O(0) => \start_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => start_count_reg(15 downto 12)
    );
\start_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[12]_i_1_n_6\,
      Q => start_count_reg(13),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[12]_i_1_n_5\,
      Q => start_count_reg(14),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[12]_i_1_n_4\,
      Q => start_count_reg(15),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[16]_i_1_n_7\,
      Q => start_count_reg(16),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \start_count_reg[12]_i_1_n_0\,
      CO(3) => \start_count_reg[16]_i_1_n_0\,
      CO(2) => \start_count_reg[16]_i_1_n_1\,
      CO(1) => \start_count_reg[16]_i_1_n_2\,
      CO(0) => \start_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \start_count_reg[16]_i_1_n_4\,
      O(2) => \start_count_reg[16]_i_1_n_5\,
      O(1) => \start_count_reg[16]_i_1_n_6\,
      O(0) => \start_count_reg[16]_i_1_n_7\,
      S(3 downto 0) => start_count_reg(19 downto 16)
    );
\start_count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[16]_i_1_n_6\,
      Q => start_count_reg(17),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[16]_i_1_n_5\,
      Q => start_count_reg(18),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[16]_i_1_n_4\,
      Q => start_count_reg(19),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[0]_i_2_n_6\,
      Q => \start_count_reg_n_0_[1]\,
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[20]_i_1_n_7\,
      Q => start_count_reg(20),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \start_count_reg[16]_i_1_n_0\,
      CO(3) => \start_count_reg[20]_i_1_n_0\,
      CO(2) => \start_count_reg[20]_i_1_n_1\,
      CO(1) => \start_count_reg[20]_i_1_n_2\,
      CO(0) => \start_count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \start_count_reg[20]_i_1_n_4\,
      O(2) => \start_count_reg[20]_i_1_n_5\,
      O(1) => \start_count_reg[20]_i_1_n_6\,
      O(0) => \start_count_reg[20]_i_1_n_7\,
      S(3 downto 0) => start_count_reg(23 downto 20)
    );
\start_count_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[20]_i_1_n_6\,
      Q => start_count_reg(21),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[20]_i_1_n_5\,
      Q => start_count_reg(22),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[20]_i_1_n_4\,
      Q => start_count_reg(23),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[24]_i_1_n_7\,
      Q => start_count_reg(24),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \start_count_reg[20]_i_1_n_0\,
      CO(3) => \NLW_start_count_reg[24]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \start_count_reg[24]_i_1_n_1\,
      CO(1) => \start_count_reg[24]_i_1_n_2\,
      CO(0) => \start_count_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \start_count_reg[24]_i_1_n_4\,
      O(2) => \start_count_reg[24]_i_1_n_5\,
      O(1) => \start_count_reg[24]_i_1_n_6\,
      O(0) => \start_count_reg[24]_i_1_n_7\,
      S(3 downto 0) => start_count_reg(27 downto 24)
    );
\start_count_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[24]_i_1_n_6\,
      Q => start_count_reg(25),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[24]_i_1_n_5\,
      Q => start_count_reg(26),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[24]_i_1_n_4\,
      Q => start_count_reg(27),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[0]_i_2_n_5\,
      Q => \start_count_reg_n_0_[2]\,
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[0]_i_2_n_4\,
      Q => \start_count_reg_n_0_[3]\,
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[4]_i_1_n_7\,
      Q => \start_count_reg_n_0_[4]\,
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \start_count_reg[0]_i_2_n_0\,
      CO(3) => \start_count_reg[4]_i_1_n_0\,
      CO(2) => \start_count_reg[4]_i_1_n_1\,
      CO(1) => \start_count_reg[4]_i_1_n_2\,
      CO(0) => \start_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \start_count_reg[4]_i_1_n_4\,
      O(2) => \start_count_reg[4]_i_1_n_5\,
      O(1) => \start_count_reg[4]_i_1_n_6\,
      O(0) => \start_count_reg[4]_i_1_n_7\,
      S(3 downto 1) => start_count_reg(7 downto 5),
      S(0) => \start_count_reg_n_0_[4]\
    );
\start_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[4]_i_1_n_6\,
      Q => start_count_reg(5),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[4]_i_1_n_5\,
      Q => start_count_reg(6),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[4]_i_1_n_4\,
      Q => start_count_reg(7),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[8]_i_1_n_7\,
      Q => start_count_reg(8),
      R => \start_count[0]_i_1_n_0\
    );
\start_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \start_count_reg[4]_i_1_n_0\,
      CO(3) => \start_count_reg[8]_i_1_n_0\,
      CO(2) => \start_count_reg[8]_i_1_n_1\,
      CO(1) => \start_count_reg[8]_i_1_n_2\,
      CO(0) => \start_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \start_count_reg[8]_i_1_n_4\,
      O(2) => \start_count_reg[8]_i_1_n_5\,
      O(1) => \start_count_reg[8]_i_1_n_6\,
      O(0) => \start_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => start_count_reg(11 downto 8)
    );
\start_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start_check_reg_n_0,
      D => \start_count_reg[8]_i_1_n_6\,
      Q => start_count_reg(9),
      R => \start_count[0]_i_1_n_0\
    );
\step[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFB7B7B7"
    )
        port map (
      I0 => \step_reg_n_0_[0]\,
      I1 => en,
      I2 => in_startup_sync,
      I3 => \step_reg_n_0_[2]\,
      I4 => \step_reg_n_0_[1]\,
      O => \step[0]_i_1_n_0\
    );
\step[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0C40808"
    )
        port map (
      I0 => \step_reg_n_0_[0]\,
      I1 => en,
      I2 => in_startup_sync,
      I3 => \step_reg_n_0_[2]\,
      I4 => \step_reg_n_0_[1]\,
      O => \step[1]_i_1_n_0\
    );
\step[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C008CC00"
    )
        port map (
      I0 => \step_reg_n_0_[0]\,
      I1 => en,
      I2 => in_startup_sync,
      I3 => \step_reg_n_0_[2]\,
      I4 => \step_reg_n_0_[1]\,
      O => \step[2]_i_1_n_0\
    );
\step_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_div,
      CE => '1',
      D => \step[0]_i_1_n_0\,
      Q => \step_reg_n_0_[0]\,
      R => '0'
    );
\step_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_div,
      CE => '1',
      D => \step[1]_i_1_n_0\,
      Q => \step_reg_n_0_[1]\,
      R => '0'
    );
\step_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_div,
      CE => '1',
      D => \step[2]_i_1_n_0\,
      Q => \step_reg_n_0_[2]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_Spindle_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    en_spindle : out STD_LOGIC;
    RPM_Out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RPM_Pulse_In : in STD_LOGIC;
    INHA : out STD_LOGIC;
    INLA : out STD_LOGIC;
    INHB : out STD_LOGIC;
    INLB : out STD_LOGIC;
    INHC : out STD_LOGIC;
    INLC : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_Spindle_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_Spindle_0_0 : entity is "top_Spindle_0_0,Spindle,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of top_Spindle_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of top_Spindle_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of top_Spindle_0_0 : entity is "Spindle,Vivado 2025.1";
end top_Spindle_0_0;

architecture STRUCTURE of top_Spindle_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^en\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
begin
  INHC <= \<const0>\;
  INLC <= \<const1>\;
  \^en\ <= en;
  en_spindle <= \^en\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.top_Spindle_0_0_Spindle
     port map (
      INHA => INHA,
      INHB => INHB,
      INLA => INLA,
      INLB => INLB,
      RPM_Out(15 downto 0) => RPM_Out(15 downto 0),
      RPM_Pulse_In => RPM_Pulse_In,
      clk => clk,
      en => \^en\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
