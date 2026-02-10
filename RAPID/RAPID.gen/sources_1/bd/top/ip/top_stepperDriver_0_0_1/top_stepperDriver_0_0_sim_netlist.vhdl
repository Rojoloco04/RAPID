-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Jan 29 15:15:06 2026
-- Host        : MDD-ECE-HPG853 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/HardSoftCodesign/Hardsoftcodesign/RAPID/RAPID.gen/sources_1/bd/top/ip/top_stepperDriver_0_0_1/top_stepperDriver_0_0_sim_netlist.vhdl
-- Design      : top_stepperDriver_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_stepperDriver_0_0_stepperDriver is
  port (
    phA1 : out STD_LOGIC;
    phB1 : out STD_LOGIC;
    phA2 : out STD_LOGIC;
    phB2 : out STD_LOGIC;
    en : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    dir : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of top_stepperDriver_0_0_stepperDriver : entity is "stepperDriver";
end top_stepperDriver_0_0_stepperDriver;

architecture STRUCTURE of top_stepperDriver_0_0_stepperDriver is
  signal NS : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NS_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \NS_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \PS[0]_i_1_n_0\ : STD_LOGIC;
  signal \PS[1]_i_1_n_0\ : STD_LOGIC;
  signal clk_div : STD_LOGIC;
  signal clk_div_i_1_n_0 : STD_LOGIC;
  signal clk_div_i_2_n_0 : STD_LOGIC;
  signal clk_div_i_3_n_0 : STD_LOGIC;
  signal counter : STD_LOGIC;
  signal \counter[9]_i_2_n_0\ : STD_LOGIC;
  signal \counter[9]_i_4_n_0\ : STD_LOGIC;
  signal \counter[9]_i_5_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^pha1\ : STD_LOGIC;
  signal \^phb1\ : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \NS_reg[0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \NS_reg[0]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \NS_reg[0]_i_1\ : label is "soft_lutpair5";
  attribute XILINX_LEGACY_PRIM of \NS_reg[1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \NS_reg[1]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \NS_reg[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \PS[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \PS[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of clk_div_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of clk_div_i_3 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[8]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[9]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[9]_i_5\ : label is "soft_lutpair2";
begin
  phA1 <= \^pha1\;
  phB1 <= \^phb1\;
\NS_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \NS_reg[0]_i_1_n_0\,
      G => en,
      GE => '1',
      Q => NS(0)
    );
\NS_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => \^pha1\,
      I1 => dir,
      I2 => reset,
      O => \NS_reg[0]_i_1_n_0\
    );
\NS_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \NS_reg[1]_i_1_n_0\,
      G => en,
      GE => '1',
      Q => NS(1)
    );
\NS_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => \^phb1\,
      I1 => dir,
      I2 => reset,
      O => \NS_reg[1]_i_1_n_0\
    );
\PS[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => NS(0),
      I1 => reset,
      O => \PS[0]_i_1_n_0\
    );
\PS[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => NS(1),
      I1 => reset,
      O => \PS[1]_i_1_n_0\
    );
\PS_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_div,
      CE => '1',
      D => \PS[0]_i_1_n_0\,
      Q => \^phb1\,
      R => '0'
    );
\PS_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_div,
      CE => '1',
      D => \PS[1]_i_1_n_0\,
      Q => \^pha1\,
      R => '0'
    );
clk_div_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0033C8FF0000C8"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(4),
      I2 => counter_reg(3),
      I3 => counter_reg(9),
      I4 => clk_div_i_2_n_0,
      I5 => clk_div_i_3_n_0,
      O => clk_div_i_1_n_0
    );
clk_div_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(5),
      I2 => counter_reg(6),
      I3 => counter_reg(8),
      O => clk_div_i_2_n_0
    );
clk_div_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01FF"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      I2 => counter_reg(2),
      I3 => counter_reg(3),
      O => clk_div_i_3_n_0
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
      I0 => counter_reg(0),
      O => p_0_in(0)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      O => p_0_in(1)
    );
\counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => counter_reg(1),
      I1 => counter_reg(0),
      I2 => counter_reg(2),
      O => p_0_in(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(0),
      I2 => counter_reg(1),
      I3 => counter_reg(3),
      O => p_0_in(3)
    );
\counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(1),
      I2 => counter_reg(0),
      I3 => counter_reg(2),
      I4 => counter_reg(4),
      O => p_0_in(4)
    );
\counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => counter_reg(1),
      I1 => counter_reg(0),
      I2 => counter_reg(2),
      I3 => counter_reg(3),
      I4 => counter_reg(4),
      I5 => counter_reg(5),
      O => p_0_in(5)
    );
\counter[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => counter_reg(5),
      I1 => \counter[9]_i_5_n_0\,
      I2 => counter_reg(6),
      O => p_0_in(6)
    );
\counter[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F708"
    )
        port map (
      I0 => counter_reg(5),
      I1 => counter_reg(6),
      I2 => \counter[9]_i_5_n_0\,
      I3 => counter_reg(7),
      O => p_0_in(7)
    );
\counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F0080"
    )
        port map (
      I0 => counter_reg(6),
      I1 => counter_reg(5),
      I2 => counter_reg(7),
      I3 => \counter[9]_i_5_n_0\,
      I4 => counter_reg(8),
      O => p_0_in(8)
    );
\counter[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF0000FE00"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(1),
      I2 => counter_reg(0),
      I3 => counter_reg(3),
      I4 => \counter[9]_i_4_n_0\,
      I5 => counter_reg(4),
      O => counter
    );
\counter[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00015555"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(0),
      I2 => counter_reg(1),
      I3 => counter_reg(2),
      I4 => counter_reg(3),
      I5 => \counter[9]_i_4_n_0\,
      O => \counter[9]_i_2_n_0\
    );
\counter[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF7FFF00008000"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(5),
      I2 => counter_reg(6),
      I3 => counter_reg(8),
      I4 => \counter[9]_i_5_n_0\,
      I5 => counter_reg(9),
      O => p_0_in(9)
    );
\counter[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => counter_reg(8),
      I1 => counter_reg(6),
      I2 => counter_reg(5),
      I3 => counter_reg(7),
      I4 => counter_reg(9),
      O => \counter[9]_i_4_n_0\
    );
\counter[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(3),
      I2 => counter_reg(2),
      I3 => counter_reg(0),
      I4 => counter_reg(1),
      O => \counter[9]_i_5_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(0),
      Q => counter_reg(0),
      R => counter
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(1),
      Q => counter_reg(1),
      R => counter
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(2),
      Q => counter_reg(2),
      R => counter
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(3),
      Q => counter_reg(3),
      R => counter
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(4),
      Q => counter_reg(4),
      R => counter
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(5),
      Q => counter_reg(5),
      R => counter
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(6),
      Q => counter_reg(6),
      R => counter
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(7),
      Q => counter_reg(7),
      R => counter
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(8),
      Q => counter_reg(8),
      R => counter
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \counter[9]_i_2_n_0\,
      D => p_0_in(9),
      Q => counter_reg(9),
      R => counter
    );
phA2_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^pha1\,
      O => phA2
    );
phB2_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^phb1\,
      O => phB2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_stepperDriver_0_0 is
  port (
    clk : in STD_LOGIC;
    dir : in STD_LOGIC;
    en : in STD_LOGIC;
    phA1 : out STD_LOGIC;
    phB1 : out STD_LOGIC;
    phA2 : out STD_LOGIC;
    phB2 : out STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_stepperDriver_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_stepperDriver_0_0 : entity is "top_stepperDriver_0_0,stepperDriver,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of top_stepperDriver_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of top_stepperDriver_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of top_stepperDriver_0_0 : entity is "stepperDriver,Vivado 2025.1";
end top_stepperDriver_0_0;

architecture STRUCTURE of top_stepperDriver_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute x_interface_mode of reset : signal is "slave reset";
  attribute x_interface_parameter of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.top_stepperDriver_0_0_stepperDriver
     port map (
      clk => clk,
      dir => dir,
      en => en,
      phA1 => phA1,
      phA2 => phA2,
      phB1 => phB1,
      phB2 => phB2,
      reset => reset
    );
end STRUCTURE;
