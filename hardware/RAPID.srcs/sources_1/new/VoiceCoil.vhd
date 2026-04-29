-- VoiceCoil.vhd - Dual-channel PWM driver for voice coil actuators.
--
-- Clock: 125 MHz. PWM frequency: ~32 kHz (period = clk_div = 3906 cycles).
--
-- VC1 (vertical / Z-axis): duty cycle set by VC1_DC (0-100 from processor GPIO).
--   Each count of VC1_DC maps to 39 PWM counter counts (~1% duty cycle steps).
--   DC_cnt_1 = 0 → 0%, DC_cnt_1 = 3906 → 100%.
--
-- VC2 (horizontal / Y-axis): reserved for future use; hardcoded to 0% (off).
--   The VC2 control process is commented out below. To enable, add VC2_DC as a
--   GPIO input and uncomment the VC2 process and port declaration.
--
-- Each channel outputs a complementary pair (PWM and PWMr carry the same signal
-- so both half-bridge inputs receive the same drive).

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VoiceCoil is
    Port ( clk    : in  STD_LOGIC;
           VC1_DC : in  STD_LOGIC_VECTOR(6 downto 0); -- duty cycle 0-100, from processor GPIO (Z-axis)
           -- VC2_DC : in STD_LOGIC_VECTOR(6 downto 0); -- reserved for Y-axis (not connected)
           PWM1   : out STD_LOGIC;  -- VC1 PWM output
           PWM1r  : out STD_LOGIC;  -- VC1 PWM output (mirrored)
           PWM2   : out STD_LOGIC;  -- VC2 PWM output (hardcoded 0%)
           PWM2r  : out STD_LOGIC); -- VC2 PWM output (mirrored, hardcoded 0%)
end VoiceCoil;

architecture Behavioral of VoiceCoil is

constant base_clk : integer := 125000000;
-- clk_div = 3906 gives ~32 kHz PWM (125 MHz / 3906 ≈ 32,002 Hz)
constant clk_div  : integer := 3906;

signal clk_div_cnt1 : integer range 0 to 3907 := 0;
signal clk_div_cnt2 : integer range 0 to 3907 := 0;

-- DC_cnt sets the on-time threshold within each PWM period (0 = 0%, clk_div = 100%)
signal DC_cnt_1 : integer range 0 to 3906 := 0;
signal DC_cnt_2 : integer range 0 to 3906 := 0;

signal PWM_1_sig : std_logic;
signal PWM_2_sig : std_logic;

begin

-- VC2 is hardcoded off; DC_cnt_2 driven by VC2 process when that channel is enabled
DC_cnt_2 <= 0;

-- PWM generator for VC1
process(clk)
begin
    if (rising_edge(clk)) then
        if (clk_div_cnt1 < DC_cnt_1) then
            PWM_1_sig <= '1';
            clk_div_cnt1 <= clk_div_cnt1 + 1;
        elsif (clk_div_cnt1 <= clk_div) and (clk_div_cnt1 >= DC_cnt_1) then
            PWM_1_sig <= '0';
            clk_div_cnt1 <= clk_div_cnt1 + 1;
        else 
            PWM_1_sig <= '1';
            clk_div_cnt1 <= 0;
        end if;
    end if;
end process;

-- PWM generator for VC2
process(clk)
begin
    if (rising_edge(clk)) then
        if (clk_div_cnt2 < DC_cnt_2) then
            PWM_2_sig <= '1';
            clk_div_cnt2 <= clk_div_cnt2 + 1;
        elsif (clk_div_cnt2 <= clk_div) and (clk_div_cnt2 >= DC_cnt_2) then
            PWM_2_sig <= '0';
            clk_div_cnt2 <= clk_div_cnt2 + 1;
        else 
            PWM_2_sig <= '1';
            clk_div_cnt2 <= 0;
        end if;
    end if;
end process;

-- NOTE: untested — replaces the lookup table with a multiplier inferred by synthesis.
-- DC_cnt_1 = VC1_DC * 39, giving 39 PWM counts per 1% duty cycle step.
DC_cnt_1 <= to_integer(unsigned(VC1_DC)) * 39;

-- VC2 control process: same structure as VC1 above, driven by VC2_DC port.
-- Not implemented: VC2_DC port is not connected in the current hardware build.
-- To enable: add VC2_DC to the entity port list, connect it to axi_gpio ch2,
-- and replace "DC_cnt_2 <= 0" with a process(VC2_DC) case statement matching
-- the VC1 decode table.

-- Output signals for voice coils
PWM1 <= PWM_1_sig;
PWM1r<= PWM_1_sig;
PWM2 <= PWM_2_sig;
PWM2r <= PWM_2_sig;

end Behavioral;
