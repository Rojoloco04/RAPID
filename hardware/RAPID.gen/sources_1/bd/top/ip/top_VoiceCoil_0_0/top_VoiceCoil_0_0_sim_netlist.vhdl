-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Apr  9 15:31:41 2026
-- Host        : MDD-ECE-HP3853 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/jparrack/Desktop/RAPID/hardware/RAPID.gen/sources_1/bd/top/ip/top_VoiceCoil_0_0/top_VoiceCoil_0_0_sim_netlist.vhdl
-- Design      : top_VoiceCoil_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_VoiceCoil_0_0_VoiceCoil is
  port (
    PWM1r : out STD_LOGIC;
    PWM2r : out STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of top_VoiceCoil_0_0_VoiceCoil : entity is "VoiceCoil";
end top_VoiceCoil_0_0_VoiceCoil;

architecture STRUCTURE of top_VoiceCoil_0_0_VoiceCoil is
  signal PWM_1_sig21_in : STD_LOGIC;
  signal \PWM_1_sig2_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \PWM_1_sig2_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \PWM_1_sig2_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \PWM_1_sig2_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \PWM_1_sig2_carry__0_n_3\ : STD_LOGIC;
  signal \PWM_1_sig2_carry__0_n_5\ : STD_LOGIC;
  signal PWM_1_sig2_carry_i_1_n_0 : STD_LOGIC;
  signal PWM_1_sig2_carry_i_2_n_0 : STD_LOGIC;
  signal PWM_1_sig2_carry_i_3_n_0 : STD_LOGIC;
  signal PWM_1_sig2_carry_i_4_n_0 : STD_LOGIC;
  signal PWM_1_sig2_carry_i_5_n_0 : STD_LOGIC;
  signal PWM_1_sig2_carry_i_6_n_0 : STD_LOGIC;
  signal PWM_1_sig2_carry_n_0 : STD_LOGIC;
  signal PWM_1_sig2_carry_n_1 : STD_LOGIC;
  signal PWM_1_sig2_carry_n_2 : STD_LOGIC;
  signal PWM_1_sig2_carry_n_3 : STD_LOGIC;
  signal PWM_2_sig20_in : STD_LOGIC;
  signal \PWM_2_sig2_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \PWM_2_sig2_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \PWM_2_sig2_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \PWM_2_sig2_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \PWM_2_sig2_carry__0_n_3\ : STD_LOGIC;
  signal \PWM_2_sig2_carry__0_n_5\ : STD_LOGIC;
  signal PWM_2_sig2_carry_i_1_n_0 : STD_LOGIC;
  signal PWM_2_sig2_carry_i_2_n_0 : STD_LOGIC;
  signal PWM_2_sig2_carry_i_3_n_0 : STD_LOGIC;
  signal PWM_2_sig2_carry_i_4_n_0 : STD_LOGIC;
  signal PWM_2_sig2_carry_i_5_n_0 : STD_LOGIC;
  signal PWM_2_sig2_carry_i_6_n_0 : STD_LOGIC;
  signal PWM_2_sig2_carry_n_0 : STD_LOGIC;
  signal PWM_2_sig2_carry_n_1 : STD_LOGIC;
  signal PWM_2_sig2_carry_n_2 : STD_LOGIC;
  signal PWM_2_sig2_carry_n_3 : STD_LOGIC;
  signal \clk_div_cnt1[0]_i_2_n_0\ : STD_LOGIC;
  signal clk_div_cnt1_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \clk_div_cnt1_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \clk_div_cnt1_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \clk_div_cnt2[0]_i_2_n_0\ : STD_LOGIC;
  signal clk_div_cnt2_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \clk_div_cnt2_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \clk_div_cnt2_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal NLW_PWM_1_sig2_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PWM_1_sig2_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_PWM_1_sig2_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_PWM_2_sig2_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PWM_2_sig2_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_PWM_2_sig2_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clk_div_cnt1_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_clk_div_cnt2_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \clk_div_cnt1_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_div_cnt1_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_div_cnt1_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_div_cnt2_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_div_cnt2_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_div_cnt2_reg[8]_i_1\ : label is 11;
begin
PWM_1_sig2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => PWM_1_sig2_carry_n_0,
      CO(2) => PWM_1_sig2_carry_n_1,
      CO(1) => PWM_1_sig2_carry_n_2,
      CO(0) => PWM_1_sig2_carry_n_3,
      CYINIT => '1',
      DI(3) => PWM_1_sig2_carry_i_1_n_0,
      DI(2 downto 1) => B"00",
      DI(0) => PWM_1_sig2_carry_i_2_n_0,
      O(3 downto 0) => NLW_PWM_1_sig2_carry_O_UNCONNECTED(3 downto 0),
      S(3) => PWM_1_sig2_carry_i_3_n_0,
      S(2) => PWM_1_sig2_carry_i_4_n_0,
      S(1) => PWM_1_sig2_carry_i_5_n_0,
      S(0) => PWM_1_sig2_carry_i_6_n_0
    );
\PWM_1_sig2_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => PWM_1_sig2_carry_n_0,
      CO(3 downto 2) => \NLW_PWM_1_sig2_carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => PWM_1_sig21_in,
      CO(0) => \PWM_1_sig2_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \PWM_1_sig2_carry__0_i_1_n_0\,
      DI(0) => \PWM_1_sig2_carry__0_i_2_n_0\,
      O(3) => \NLW_PWM_1_sig2_carry__0_O_UNCONNECTED\(3),
      O(2) => \PWM_1_sig2_carry__0_n_5\,
      O(1 downto 0) => \NLW_PWM_1_sig2_carry__0_O_UNCONNECTED\(1 downto 0),
      S(3 downto 2) => B"01",
      S(1) => \PWM_1_sig2_carry__0_i_3_n_0\,
      S(0) => \PWM_1_sig2_carry__0_i_4_n_0\
    );
\PWM_1_sig2_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => clk_div_cnt1_reg(10),
      I1 => clk_div_cnt1_reg(11),
      O => \PWM_1_sig2_carry__0_i_1_n_0\
    );
\PWM_1_sig2_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => clk_div_cnt1_reg(8),
      I1 => clk_div_cnt1_reg(9),
      O => \PWM_1_sig2_carry__0_i_2_n_0\
    );
\PWM_1_sig2_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clk_div_cnt1_reg(10),
      I1 => clk_div_cnt1_reg(11),
      O => \PWM_1_sig2_carry__0_i_3_n_0\
    );
\PWM_1_sig2_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clk_div_cnt1_reg(8),
      I1 => clk_div_cnt1_reg(9),
      O => \PWM_1_sig2_carry__0_i_4_n_0\
    );
PWM_1_sig2_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt1_reg(6),
      I1 => clk_div_cnt1_reg(7),
      O => PWM_1_sig2_carry_i_1_n_0
    );
PWM_1_sig2_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt1_reg(1),
      O => PWM_1_sig2_carry_i_2_n_0
    );
PWM_1_sig2_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clk_div_cnt1_reg(6),
      I1 => clk_div_cnt1_reg(7),
      O => PWM_1_sig2_carry_i_3_n_0
    );
PWM_1_sig2_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt1_reg(4),
      I1 => clk_div_cnt1_reg(5),
      O => PWM_1_sig2_carry_i_4_n_0
    );
PWM_1_sig2_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt1_reg(2),
      I1 => clk_div_cnt1_reg(3),
      O => PWM_1_sig2_carry_i_5_n_0
    );
PWM_1_sig2_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clk_div_cnt1_reg(1),
      I1 => clk_div_cnt1_reg(0),
      O => PWM_1_sig2_carry_i_6_n_0
    );
PWM_1_sig_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \PWM_1_sig2_carry__0_n_5\,
      Q => PWM1r,
      R => '0'
    );
PWM_2_sig2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => PWM_2_sig2_carry_n_0,
      CO(2) => PWM_2_sig2_carry_n_1,
      CO(1) => PWM_2_sig2_carry_n_2,
      CO(0) => PWM_2_sig2_carry_n_3,
      CYINIT => '1',
      DI(3) => PWM_2_sig2_carry_i_1_n_0,
      DI(2 downto 1) => B"00",
      DI(0) => PWM_2_sig2_carry_i_2_n_0,
      O(3 downto 0) => NLW_PWM_2_sig2_carry_O_UNCONNECTED(3 downto 0),
      S(3) => PWM_2_sig2_carry_i_3_n_0,
      S(2) => PWM_2_sig2_carry_i_4_n_0,
      S(1) => PWM_2_sig2_carry_i_5_n_0,
      S(0) => PWM_2_sig2_carry_i_6_n_0
    );
\PWM_2_sig2_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => PWM_2_sig2_carry_n_0,
      CO(3 downto 2) => \NLW_PWM_2_sig2_carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => PWM_2_sig20_in,
      CO(0) => \PWM_2_sig2_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \PWM_2_sig2_carry__0_i_1_n_0\,
      DI(0) => \PWM_2_sig2_carry__0_i_2_n_0\,
      O(3) => \NLW_PWM_2_sig2_carry__0_O_UNCONNECTED\(3),
      O(2) => \PWM_2_sig2_carry__0_n_5\,
      O(1 downto 0) => \NLW_PWM_2_sig2_carry__0_O_UNCONNECTED\(1 downto 0),
      S(3 downto 2) => B"01",
      S(1) => \PWM_2_sig2_carry__0_i_3_n_0\,
      S(0) => \PWM_2_sig2_carry__0_i_4_n_0\
    );
\PWM_2_sig2_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => clk_div_cnt2_reg(10),
      I1 => clk_div_cnt2_reg(11),
      O => \PWM_2_sig2_carry__0_i_1_n_0\
    );
\PWM_2_sig2_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => clk_div_cnt2_reg(8),
      I1 => clk_div_cnt2_reg(9),
      O => \PWM_2_sig2_carry__0_i_2_n_0\
    );
\PWM_2_sig2_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clk_div_cnt2_reg(10),
      I1 => clk_div_cnt2_reg(11),
      O => \PWM_2_sig2_carry__0_i_3_n_0\
    );
\PWM_2_sig2_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clk_div_cnt2_reg(8),
      I1 => clk_div_cnt2_reg(9),
      O => \PWM_2_sig2_carry__0_i_4_n_0\
    );
PWM_2_sig2_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt2_reg(6),
      I1 => clk_div_cnt2_reg(7),
      O => PWM_2_sig2_carry_i_1_n_0
    );
PWM_2_sig2_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt2_reg(1),
      O => PWM_2_sig2_carry_i_2_n_0
    );
PWM_2_sig2_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clk_div_cnt2_reg(6),
      I1 => clk_div_cnt2_reg(7),
      O => PWM_2_sig2_carry_i_3_n_0
    );
PWM_2_sig2_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt2_reg(4),
      I1 => clk_div_cnt2_reg(5),
      O => PWM_2_sig2_carry_i_4_n_0
    );
PWM_2_sig2_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt2_reg(2),
      I1 => clk_div_cnt2_reg(3),
      O => PWM_2_sig2_carry_i_5_n_0
    );
PWM_2_sig2_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clk_div_cnt2_reg(1),
      I1 => clk_div_cnt2_reg(0),
      O => PWM_2_sig2_carry_i_6_n_0
    );
PWM_2_sig_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \PWM_2_sig2_carry__0_n_5\,
      Q => PWM2r,
      R => '0'
    );
\clk_div_cnt1[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt1_reg(0),
      O => \clk_div_cnt1[0]_i_2_n_0\
    );
\clk_div_cnt1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[0]_i_1_n_7\,
      Q => clk_div_cnt1_reg(0),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \clk_div_cnt1_reg[0]_i_1_n_0\,
      CO(2) => \clk_div_cnt1_reg[0]_i_1_n_1\,
      CO(1) => \clk_div_cnt1_reg[0]_i_1_n_2\,
      CO(0) => \clk_div_cnt1_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \clk_div_cnt1_reg[0]_i_1_n_4\,
      O(2) => \clk_div_cnt1_reg[0]_i_1_n_5\,
      O(1) => \clk_div_cnt1_reg[0]_i_1_n_6\,
      O(0) => \clk_div_cnt1_reg[0]_i_1_n_7\,
      S(3 downto 1) => clk_div_cnt1_reg(3 downto 1),
      S(0) => \clk_div_cnt1[0]_i_2_n_0\
    );
\clk_div_cnt1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[8]_i_1_n_5\,
      Q => clk_div_cnt1_reg(10),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[8]_i_1_n_4\,
      Q => clk_div_cnt1_reg(11),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[0]_i_1_n_6\,
      Q => clk_div_cnt1_reg(1),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[0]_i_1_n_5\,
      Q => clk_div_cnt1_reg(2),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[0]_i_1_n_4\,
      Q => clk_div_cnt1_reg(3),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[4]_i_1_n_7\,
      Q => clk_div_cnt1_reg(4),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_div_cnt1_reg[0]_i_1_n_0\,
      CO(3) => \clk_div_cnt1_reg[4]_i_1_n_0\,
      CO(2) => \clk_div_cnt1_reg[4]_i_1_n_1\,
      CO(1) => \clk_div_cnt1_reg[4]_i_1_n_2\,
      CO(0) => \clk_div_cnt1_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_div_cnt1_reg[4]_i_1_n_4\,
      O(2) => \clk_div_cnt1_reg[4]_i_1_n_5\,
      O(1) => \clk_div_cnt1_reg[4]_i_1_n_6\,
      O(0) => \clk_div_cnt1_reg[4]_i_1_n_7\,
      S(3 downto 0) => clk_div_cnt1_reg(7 downto 4)
    );
\clk_div_cnt1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[4]_i_1_n_6\,
      Q => clk_div_cnt1_reg(5),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[4]_i_1_n_5\,
      Q => clk_div_cnt1_reg(6),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[4]_i_1_n_4\,
      Q => clk_div_cnt1_reg(7),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[8]_i_1_n_7\,
      Q => clk_div_cnt1_reg(8),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt1_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_div_cnt1_reg[4]_i_1_n_0\,
      CO(3) => \NLW_clk_div_cnt1_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \clk_div_cnt1_reg[8]_i_1_n_1\,
      CO(1) => \clk_div_cnt1_reg[8]_i_1_n_2\,
      CO(0) => \clk_div_cnt1_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_div_cnt1_reg[8]_i_1_n_4\,
      O(2) => \clk_div_cnt1_reg[8]_i_1_n_5\,
      O(1) => \clk_div_cnt1_reg[8]_i_1_n_6\,
      O(0) => \clk_div_cnt1_reg[8]_i_1_n_7\,
      S(3 downto 0) => clk_div_cnt1_reg(11 downto 8)
    );
\clk_div_cnt1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt1_reg[8]_i_1_n_6\,
      Q => clk_div_cnt1_reg(9),
      R => \PWM_1_sig2_carry__0_n_5\
    );
\clk_div_cnt2[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_div_cnt2_reg(0),
      O => \clk_div_cnt2[0]_i_2_n_0\
    );
\clk_div_cnt2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[0]_i_1_n_7\,
      Q => clk_div_cnt2_reg(0),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \clk_div_cnt2_reg[0]_i_1_n_0\,
      CO(2) => \clk_div_cnt2_reg[0]_i_1_n_1\,
      CO(1) => \clk_div_cnt2_reg[0]_i_1_n_2\,
      CO(0) => \clk_div_cnt2_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \clk_div_cnt2_reg[0]_i_1_n_4\,
      O(2) => \clk_div_cnt2_reg[0]_i_1_n_5\,
      O(1) => \clk_div_cnt2_reg[0]_i_1_n_6\,
      O(0) => \clk_div_cnt2_reg[0]_i_1_n_7\,
      S(3 downto 1) => clk_div_cnt2_reg(3 downto 1),
      S(0) => \clk_div_cnt2[0]_i_2_n_0\
    );
\clk_div_cnt2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[8]_i_1_n_5\,
      Q => clk_div_cnt2_reg(10),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[8]_i_1_n_4\,
      Q => clk_div_cnt2_reg(11),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[0]_i_1_n_6\,
      Q => clk_div_cnt2_reg(1),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[0]_i_1_n_5\,
      Q => clk_div_cnt2_reg(2),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[0]_i_1_n_4\,
      Q => clk_div_cnt2_reg(3),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[4]_i_1_n_7\,
      Q => clk_div_cnt2_reg(4),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_div_cnt2_reg[0]_i_1_n_0\,
      CO(3) => \clk_div_cnt2_reg[4]_i_1_n_0\,
      CO(2) => \clk_div_cnt2_reg[4]_i_1_n_1\,
      CO(1) => \clk_div_cnt2_reg[4]_i_1_n_2\,
      CO(0) => \clk_div_cnt2_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_div_cnt2_reg[4]_i_1_n_4\,
      O(2) => \clk_div_cnt2_reg[4]_i_1_n_5\,
      O(1) => \clk_div_cnt2_reg[4]_i_1_n_6\,
      O(0) => \clk_div_cnt2_reg[4]_i_1_n_7\,
      S(3 downto 0) => clk_div_cnt2_reg(7 downto 4)
    );
\clk_div_cnt2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[4]_i_1_n_6\,
      Q => clk_div_cnt2_reg(5),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[4]_i_1_n_5\,
      Q => clk_div_cnt2_reg(6),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[4]_i_1_n_4\,
      Q => clk_div_cnt2_reg(7),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[8]_i_1_n_7\,
      Q => clk_div_cnt2_reg(8),
      R => \PWM_2_sig2_carry__0_n_5\
    );
\clk_div_cnt2_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_div_cnt2_reg[4]_i_1_n_0\,
      CO(3) => \NLW_clk_div_cnt2_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \clk_div_cnt2_reg[8]_i_1_n_1\,
      CO(1) => \clk_div_cnt2_reg[8]_i_1_n_2\,
      CO(0) => \clk_div_cnt2_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_div_cnt2_reg[8]_i_1_n_4\,
      O(2) => \clk_div_cnt2_reg[8]_i_1_n_5\,
      O(1) => \clk_div_cnt2_reg[8]_i_1_n_6\,
      O(0) => \clk_div_cnt2_reg[8]_i_1_n_7\,
      S(3 downto 0) => clk_div_cnt2_reg(11 downto 8)
    );
\clk_div_cnt2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \clk_div_cnt2_reg[8]_i_1_n_6\,
      Q => clk_div_cnt2_reg(9),
      R => \PWM_2_sig2_carry__0_n_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_VoiceCoil_0_0 is
  port (
    clk : in STD_LOGIC;
    PWM1 : out STD_LOGIC;
    PWM1r : out STD_LOGIC;
    PWM2 : out STD_LOGIC;
    PWM2r : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_VoiceCoil_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_VoiceCoil_0_0 : entity is "top_VoiceCoil_0_0,VoiceCoil,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of top_VoiceCoil_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of top_VoiceCoil_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of top_VoiceCoil_0_0 : entity is "VoiceCoil,Vivado 2025.1";
end top_VoiceCoil_0_0;

architecture STRUCTURE of top_VoiceCoil_0_0 is
  signal \^pwm1r\ : STD_LOGIC;
  signal \^pwm2r\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
begin
  PWM1 <= \^pwm1r\;
  PWM1r <= \^pwm1r\;
  PWM2 <= \^pwm2r\;
  PWM2r <= \^pwm2r\;
U0: entity work.top_VoiceCoil_0_0_VoiceCoil
     port map (
      PWM1r => \^pwm1r\,
      PWM2r => \^pwm2r\,
      clk => clk
    );
end STRUCTURE;
