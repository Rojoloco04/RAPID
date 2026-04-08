----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2026 12:15:17 PM
-- Design Name: 
-- Module Name: VoiceCoil - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VoiceCoil is
    Port ( clk : in STD_LOGIC;
           --VC1_DC : in STD_LOGIC_VECTOR(6 downto 0);      --added for future use, software sel of voice coil duty cycle
           --VC2_DC : in STD_LOGIC_VECTOR(6 downto 0);      --added for future use
           PWM1 : out STD_LOGIC;    --PWM out for VC1
           PWM1r : out STD_LOGIC;   --PWM out mirror for VC1 (both receive same PWM input)
           PWM2 : out STD_LOGIC;    --PWM out for VC1
           PWM2r : out STD_LOGIC);  --PWM out mirror for VC1 (both receive same PWM input)
end VoiceCoil;

architecture Behavioral of VoiceCoil is

--clk div signals
constant base_clk : integer := 125000000;
constant clk_div : integer := 3906; --3906.25 is actual for 32k; 1953 for 50% duty cycle
signal clk_div_cnt1 : integer range 0 to 3907 := 0;
signal clk_div_cnt2 : integer range 0 to 3907 := 0;
signal clk_div_out : std_logic;

--internal duty cycle counts for voice coils
signal DC_cnt_1 : integer range 0 to 3906 := 0;
signal DC_cnt_2 : integer range 0 to 3906 := 0;

signal PWM_1_sig : std_logic;
signal PWM_2_sig : std_logic;

begin


--clock dividers giving 32k Hz to voice coils (actual ~32,002.04)
--clock divider PWM 1
process(clk)
begin
    if (clk_div_cnt1 < DC_cnt_1) then
        PWM_1_sig <= '1';
    elsif (clk_div_cnt1 <= clk_div) and (clk_div_cnt1 >= DC_cnt_1) then
        PWM_1_sig <= '0';
    else 
        PWM_1_sig <= '1';
        clk_div_cnt1 <= 0;
    end if;
end process;

--clock divider PWM 2
process(clk)
begin
    if (clk_div_cnt2 < DC_cnt_2) then
        PWM_2_sig <= '1';
    elsif (clk_div_cnt2 <= clk_div) and (clk_div_cnt2 >= DC_cnt_2) then
        PWM_2_sig <= '0';
    else 
        PWM_2_sig <= '1';
        clk_div_cnt2 <= 0;
    end if;
end process;

--Case statement for variable duty cycle VC1)
--to use, uncomment and interface processor GPIO for DC selection signals
--process (VC1_DC)    --changes duty cycle of signal based on received input
--begin
--case VC1_DC is
--    when "0000000"=>
--        PWM_1_sig <= '0';
--    when "0000001"=>
--        DC_cnt_1 <= 39;
--    when "0000010"=> 
--        DC_cnt_1 <= 78;
--    when "0000011"=>
--        DC_cnt_1 <= 117;
--    when "0000100"=>
--        DC_cnt_1 <=156;
--    when "0000101"=>
--        DC_cnt_1 <= 195;
--    when "0000110" =>
--        DC_cnt_1 <= 234;
--    when "0000111" =>
--        DC_cnt_1 <= 273;
--    when "0001000" =>
--        DC_cnt_1 <= 312;
--    when "0001001" =>
--        DC_cnt_1 <= 351;
--    when "0001010" =>
--        DC_cnt_1 <= 390;
--    when "0001011" =>
--        DC_cnt_1 <= 429;
--    when "0001100" =>
--        DC_cnt_1 <= 468;
--    when "0001101" =>
--        DC_cnt_1 <= 507;
--    when "0001110" =>
--        DC_cnt_1 <= 546;
--    when "0001111" =>
--        DC_cnt_1 <= 585;
--    when "0010000" =>
--        DC_cnt_1 <= 624;
--    when "0010001" =>
--        DC_cnt_1 <= 663;
--    when "0010010" =>
--        DC_cnt_1 <= 702;
--    when "0010011" =>
--        DC_cnt_1 <= 741;
--    when "0010100" =>
--        DC_cnt_1 <= 780;
--    when "0010101" =>
--        DC_cnt_1 <= 819;
--    when "0010110" =>
--        DC_cnt_1 <= 858;
--    when "0010111" =>
--        DC_cnt_1 <= 897;
--    when "0011000" =>
--        DC_cnt_1 <= 936;
--    when "0011001" =>
--        DC_cnt_1 <= 975;
--    when "0011010" =>
--        DC_cnt_1 <= 1014;
--    when "0011011" =>
--        DC_cnt_1 <= 1053;
--    when "0011100" =>
--        DC_cnt_1 <= 1092;
--    when "0011101" =>
--        DC_cnt_1 <= 1131;
--    when "0011110" =>
--        DC_cnt_1 <= 1170;
--    when "0011111" =>
--        DC_cnt_1 <= 1209;
--    when "0100000" =>
--        DC_cnt_1 <= 1248;
--    when "0100001" =>
--        DC_cnt_1 <= 1287;
--    when "0100010" =>
--        DC_cnt_1 <= 1326;
--    when "0100011" =>
--        DC_cnt_1 <= 1365;
--    when "0100100" =>
--        DC_cnt_1 <= 1404;
--    when "0100101" =>
--        DC_cnt_1 <= 1443;
--    when "0100110" =>
--        DC_cnt_1 <= 1482;
--    when "0100111" =>
--        DC_cnt_1 <= 1521;
--    when "0101000" =>
--        DC_cnt_1 <= 1560;
--    when "0101001" =>
--        DC_cnt_1 <= 1599;
--    when "0101010" =>
--        DC_cnt_1 <= 1638;
--    when "0101011" =>
--        DC_cnt_1 <= 1677;
--    when "0101100" =>
--        DC_cnt_1 <= 1716;
--    when "0101101" =>
--        DC_cnt_1 <= 1755;
--    when "0101110" =>
--        DC_cnt_1 <= 1794;
--    when "0101111" =>
--        DC_cnt_1 <= 1833;
--    when "0110000" =>
--        DC_cnt_1 <= 1872;
--    when "0110001" =>
--        DC_cnt_1 <= 1911;
--    when "0110010" =>
--        DC_cnt_1 <= 1950;
--    when "0110011" =>
--        DC_cnt_1 <= 1989;
--    when "0110100" =>
--        DC_cnt_1 <= 2028;
--    when "0110101" =>
--        DC_cnt_1 <= 2067;
--    when "0110110" =>
--        DC_cnt_1 <= 2106;
--    when "0110111" =>
--        DC_cnt_1 <= 2145;
--    when "0111000" =>
--        DC_cnt_1 <= 2184;
--    when "0111001" =>
--        DC_cnt_1 <= 2223;
--    when "0111010" =>
--        DC_cnt_1 <= 2262;
--    when "0111011" =>
--        DC_cnt_1 <= 2301;
--    when "0111100" =>
--        DC_cnt_1 <= 2340;
--    when "0111101" =>
--        DC_cnt_1 <= 2379;
--    when "0111110" =>
--        DC_cnt_1 <= 2418;
--    when "0111111" =>
--        DC_cnt_1 <= 2457;
--    when "1000000" =>
--        DC_cnt_1 <= 2496;
--    when "1000001" =>
--        DC_cnt_1 <= 2535;
--    when "1000010" =>
--        DC_cnt_1 <= 2574;
--    when "1000011" =>
--        DC_cnt_1 <= 2613;
--    when "1000100" =>
--        DC_cnt_1 <= 2652;
--    when "1000101" =>
--        DC_cnt_1 <= 2691;
--    when "1000110" =>
--        DC_cnt_1 <= 2730;
--    when "1000111" =>
--        DC_cnt_1 <= 2769;
--    when "1001000" =>
--        DC_cnt_1 <= 2808;
--    when "1001001" =>
--        DC_cnt_1 <= 2847;
--    when "1001010" =>
--        DC_cnt_1 <= 2886;
--    when "1001011" =>
--        DC_cnt_1 <= 2925;
--    when "1001100" =>
--        DC_cnt_1 <= 2964;
--    when "1001101" =>
--        DC_cnt_1 <= 3003;
--    when "1001110" =>
--        DC_cnt_1 <= 3042;
--    when "1001111" =>
--        DC_cnt_1 <= 3081;
--    when "1010000" =>
--        DC_cnt_1 <= 3120;
--    when "1010001" =>
--        DC_cnt_1 <= 3159;
--    when "1010010" =>
--        DC_cnt_1 <= 3198;
--    when "1010011" =>
--        DC_cnt_1 <= 3237;
--    when "1010100" =>
--        DC_cnt_1 <= 3276;
--    when "1010101" =>
--        DC_cnt_1 <= 3315;
--    when "1010110" =>
--        DC_cnt_1 <= 3354;
--    when "1010111" =>
--        DC_cnt_1 <= 3393;
--    when "1011000" =>
--        DC_cnt_1 <= 3432;
--    when "1011001" =>
--        DC_cnt_1 <= 3471;
--    when "1011010" =>
--        DC_cnt_1 <= 3510;
--    when "1011011" =>
--        DC_cnt_1 <= 3549;
--    when "1011100" =>
--        DC_cnt_1 <= 3588;
--    when "1011101" =>
--        DC_cnt_1 <= 3627;
--    when "1011110" =>
--        DC_cnt_1 <= 3666;
--    when "1011111" =>
--        DC_cnt_1 <= 3705;
--    when "1100000" =>
--        DC_cnt_1 <= 3744;
--    when "1100001" =>
--        DC_cnt_1 <= 3783;
--    when "1100010" =>
--        DC_cnt_1 <= 3822;
--    when "1100011" =>
--        DC_cnt_1 <= 3861;
--    when "1100100" =>
--        PWM_1_sig<='1';
--    when "others" =>
--        PWM_1_sig<='0';
--    end case;
--end process;

--process (VC2_DC)        --allows 1% duty cycle change 
--begin
--case VC2_DC is
--    when "0000000"=>        --0% DC
--        PWM_2_sig <= '0';
--    when "0000001"=>        --increments 1% 
--        DC_cnt_2 <= 39;
--    when "0000010"=> 
--        DC_cnt_2 <= 78;
--    when "0000011"=>
--        DC_cnt_2 <= 117;
--    when "0000100"=>
--        DC_cnt_2 <=156;
--    when "0000101"=>
--        DC_cnt_2 <= 195;
--    when "0000110" =>
--        DC_cnt_2 <= 234;
--    when "0000111" =>
--        DC_cnt_2 <= 273;
--    when "0001000" =>
--        DC_cnt_2 <= 312;
--    when "0001001" =>
--        DC_cnt_2 <= 351;
--    when "0001010" =>
--        DC_cnt_2 <= 390;
--    when "0001011" =>
--        DC_cnt_2 <= 429;
--    when "0001100" =>
--        DC_cnt_2 <= 468;
--    when "0001101" =>
--        DC_cnt_2 <= 507;
--    when "0001110" =>
--        DC_cnt_2 <= 546;
--    when "0001111" =>
--        DC_cnt_2 <= 585;
--    when "0010000" =>
--        DC_cnt_2 <= 624;
--    when "0010001" =>
--        DC_cnt_2 <= 663;
--    when "0010010" =>
--        DC_cnt_2 <= 702;
--    when "0010011" =>
--        DC_cnt_2 <= 741;
--    when "0010100" =>
--        DC_cnt_2 <= 780;
--    when "0010101" =>
--        DC_cnt_2 <= 819;
--    when "0010110" =>
--        DC_cnt_2 <= 858;
--    when "0010111" =>
--        DC_cnt_2 <= 897;
--    when "0011000" =>
--        DC_cnt_2 <= 936;
--    when "0011001" =>
--        DC_cnt_2 <= 975;
--    when "0011010" =>
--        DC_cnt_2 <= 1014;
--    when "0011011" =>
--        DC_cnt_2 <= 1053;
--    when "0011100" =>
--        DC_cnt_2 <= 1092;
--    when "0011101" =>
--        DC_cnt_2 <= 1131;
--    when "0011110" =>
--        DC_cnt_2 <= 1170;
--    when "0011111" =>
--        DC_cnt_2 <= 1209;
--    when "0100000" =>
--        DC_cnt_2 <= 1248;
--    when "0100001" =>
--        DC_cnt_2 <= 1287;
--    when "0100010" =>
--        DC_cnt_2 <= 1326;
--    when "0100011" =>
--        DC_cnt_2 <= 1365;
--    when "0100100" =>
--        DC_cnt_2 <= 1404;
--    when "0100101" =>
--        DC_cnt_2 <= 1443;
--    when "0100110" =>
--        DC_cnt_2 <= 1482;
--    when "0100111" =>
--        DC_cnt_2 <= 1521;
--    when "0101000" =>
--        DC_cnt_2 <= 1560;
--    when "0101001" =>
--        DC_cnt_2 <= 1599;
--    when "0101010" =>
--        DC_cnt_2 <= 1638;
--    when "0101011" =>
--        DC_cnt_2 <= 1677;
--    when "0101100" =>
--        DC_cnt_2 <= 1716;
--    when "0101101" =>
--        DC_cnt_2 <= 1755;
--    when "0101110" =>
--        DC_cnt_2 <= 1794;
--    when "0101111" =>
--        DC_cnt_2 <= 1833;
--    when "0110000" =>
--        DC_cnt_2 <= 1872;
--    when "0110001" =>
--        DC_cnt_2 <= 1911;
--    when "0110010" =>
--        DC_cnt_2 <= 1950;
--    when "0110011" =>
--        DC_cnt_2 <= 1989;
--    when "0110100" =>
--        DC_cnt_2 <= 2028;
--    when "0110101" =>
--        DC_cnt_2 <= 2067;
--    when "0110110" =>
--        DC_cnt_2 <= 2106;
--    when "0110111" =>
--        DC_cnt_2 <= 2145;
--    when "0111000" =>
--        DC_cnt_2 <= 2184;
--    when "0111001" =>
--        DC_cnt_2 <= 2223;
--    when "0111010" =>
--        DC_cnt_2 <= 2262;
--    when "0111011" =>
--        DC_cnt_2 <= 2301;
--    when "0111100" =>
--        DC_cnt_2 <= 2340;
--    when "0111101" =>
--        DC_cnt_2 <= 2379;
--    when "0111110" =>
--        DC_cnt_2 <= 2418;
--    when "0111111" =>
--        DC_cnt_2 <= 2457;
--    when "1000000" =>
--        DC_cnt_2 <= 2496;
--    when "1000001" =>
--        DC_cnt_2 <= 2535;
--    when "1000010" =>
--        DC_cnt_2 <= 2574;
--    when "1000011" =>
--        DC_cnt_2 <= 2613;
--    when "1000100" =>
--        DC_cnt_2 <= 2652;
--    when "1000101" =>
--        DC_cnt_2 <= 2691;
--    when "1000110" =>
--        DC_cnt_2 <= 2730;
--    when "1000111" =>
--        DC_cnt_2 <= 2769;
--    when "1001000" =>
--        DC_cnt_2 <= 2808;
--    when "1001001" =>
--        DC_cnt_2 <= 2847;
--    when "1001010" =>
--        DC_cnt_2 <= 2886;
--    when "1001011" =>
--        DC_cnt_2 <= 2925;
--    when "1001100" =>
--        DC_cnt_2 <= 2964;
--    when "1001101" =>
--        DC_cnt_2 <= 3003;
--    when "1001110" =>
--        DC_cnt_2 <= 3042;
--    when "1001111" =>
--        DC_cnt_2 <= 3081;
--    when "1010000" =>
--        DC_cnt_2 <= 3120;
--    when "1010001" =>
--        DC_cnt_2 <= 3159;
--    when "1010010" =>
--        DC_cnt_2 <= 3198;
--    when "1010011" =>
--        DC_cnt_2 <= 3237;
--    when "1010100" =>
--        DC_cnt_2 <= 3276;
--    when "1010101" =>
--        DC_cnt_2 <= 3315;
--    when "1010110" =>
--        DC_cnt_2 <= 3354;
--    when "1010111" =>
--        DC_cnt_2 <= 3393;
--    when "1011000" =>
--        DC_cnt_2 <= 3432;
--    when "1011001" =>
--        DC_cnt_2 <= 3471;
--    when "1011010" =>
--        DC_cnt_2 <= 3510;
--    when "1011011" =>
--        DC_cnt_2 <= 3549;
--    when "1011100" =>
--        DC_cnt_2 <= 3588;
--    when "1011101" =>
--        DC_cnt_2 <= 3627;
--    when "1011110" =>
--        DC_cnt_2 <= 3666;
--    when "1011111" =>
--        DC_cnt_2 <= 3705;
--    when "1100000" =>
--        DC_cnt_2 <= 3744;
--    when "1100001" =>
--        DC_cnt_2 <= 3783;
--    when "1100010" =>
--        DC_cnt_2 <= 3822;
--    when "1100011" =>
--        DC_cnt_2 <= 3861;
--    when "1100100" =>       --100% DC
--        PWM_2_sig <= '1';
--    when "others" =>
--        PWM_2_sig <= '0';
--end case;
--end process;


--output signals for voice coils
PWM1 <= PWM_1_sig;
PWM1r<= PWM_1_sig;
PWM2 <= PWM_2_sig;
PWM2r <= PWM_2_sig;
        
        


end Behavioral;
