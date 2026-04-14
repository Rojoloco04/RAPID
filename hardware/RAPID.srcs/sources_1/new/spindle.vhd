----------------------------------------------------------------------------------
-- Company: RAPID
-- Engineer: Chance, Matt
-- 
-- Create Date: 11/07/2025 11:40:49 AM
-- Design Name: BLDC Driver
-- Module Name: Spindle - Behavioral
-- Project Name: RAPID
-- Target Devices: Arty Z7
-- Tool Versions: 2025.1
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
use IEEE.NUMERIC_STD.ALL;

entity Spindle is
    Port (  clk : in  STD_LOGIC; -- 125 MHz
            en : in STD_LOGIC; --enable 
            en_spindle : out STD_LOGIC; --enable for DRV8323
            RPM_Out : out STD_LOGIC_VECTOR(15 downto 0);
            RPM_Pulse_In : in STD_LOGIC;
            INHA : out STD_LOGIC;  -- PWM input
            INLA : out STD_LOGIC;  -- State input 
            INHB : out STD_LOGIC;  -- State input 
            INLB : out STD_LOGIC;  -- State input 
            INHC : out STD_LOGIC;  -- Direction control
            INLC : out STD_LOGIC); -- Brake control (tie high normally)is 1
end Spindle;

architecture Behavioral of Spindle is
signal counter : integer range 0 to 416666668 := 0;
signal count_max : integer range 500 to 416666668 := 416666668;
signal clk_div : std_logic := '0';
signal step : integer range 1 to 6 := 1;
signal pwm_counter : integer range 0 to 125000001 := 0;
signal pwm_signal : std_logic := '0';
signal start_check : std_logic := '1';
signal start_count : integer range 0 to 187500002 := 0;
signal in_startup : std_logic := '0';

signal in_startup_s1 : std_logic := '0';
signal in_startup_sync : std_logic := '0';
signal duty_cycle_count : integer range 0 to 5000 := 4000; -- 80% at 25kHz

constant RPM_CLK : integer := 125000;
signal RPM_CLK_DIV : integer range 0 to 125001 := 0;
signal RPM_CLK_CNT : integer range 0 to 65535 := 0;
signal RPM_OUT_SIG : std_logic_vector (15 downto 0);
signal RPM_SYNC     : std_logic_vector(1 downto 0) := (others => '0'); -- 2-stage metastability sync
signal RPM_DEBOUNCE : std_logic_vector(7 downto 0) := (others => '0'); -- 8-bit 1kHz debounce shift reg
signal RPM_STABLE   : std_logic := '0'; -- last stable level

begin

-- Commutation frequency: count_max=6,410,256 gives ~14.5 Hz (~1 rev / 1.8 s)
--count_max <= 200000 when (speed = "00") else  -- Slowest
--             100000 when (speed = "01") else  
--             50000 when (speed = "10") else   
--             25000;                           -- Fastest
--12,820,512 gives 9.75 Hz = too jerky/unusable
--10,309,278 gives 12.13 Hz = ~1 rotation every 3 seconds - slightly jerky
--9,387,908 gives 13.32 Hz = 1 rotation every 2.6 seconds
--6,410,256 gives ~14.5 Hz = 1 rotation everhy 1.8 seconds, Smoothest/slowest
--3,205,128 gives ~39 Hz = 1 RPS
count_max <= 12500000; --10 hz

-- Clock divider
process(clk)
begin
    if rising_edge(clk) then
        if counter < (count_max / 2) then
            counter <= counter + 1;
            clk_div <= '0';
        elsif (counter >= (count_max / 2)) and (counter <= count_max) then
            counter <= counter + 1;
            clk_div <= '1';
        elsif counter > count_max then
            counter <= 0;
            clk_div <= '0';
        end if;
    end if;
end process;

--metastability 
process(clk_div)
begin
    if rising_edge(clk_div) then
        in_startup_s1 <= in_startup;
        in_startup_sync <= in_startup_s1;
    end if;
end process;


-- PWM Generator @ ~10Hz
process(clk)
begin
    if rising_edge(clk) then
        if pwm_counter < 12500000 then
            pwm_counter <= pwm_counter + 1;
        else
            pwm_counter <= 0;
        end if;
        
        if pwm_counter < 125000 then
            pwm_signal <= '1';
        else
            pwm_signal <= '0';
        end if;
    end if;
end process;

process(clk) --logic for initial startup allign phase
begin
    if rising_edge(clk) then
        if en = '0' then
            start_check <= '1';
            start_count <= 0;
            in_startup <= '0';
        elsif en = '1' and start_check = '1' then
            if start_count < 187500000 then
                in_startup <= '1';
                start_count <= start_count + 1;
            else 
                in_startup <= '0';
                start_check <= '0';
                start_count <= 0;
            end if;
        end if;
    end if;
end process;

-- RPM measurement
process(clk)
begin
    if rising_edge(clk) then
        if en = '0' then
            RPM_CLK_DIV  <= 0;
            RPM_CLK_CNT  <= 0;
            RPM_OUT_SIG  <= (others => '0');
            RPM_SYNC     <= (others => '0');
            RPM_DEBOUNCE <= (others => '0');
            RPM_STABLE   <= '0';
        else
            -- Metastability sync at 125 MHz
            RPM_SYNC <= RPM_SYNC(0) & RPM_Pulse_In;

            -- 1 kHz clock enable
            if RPM_CLK_DIV < RPM_CLK - 1 then
                RPM_CLK_DIV <= RPM_CLK_DIV + 1;
            else
                RPM_CLK_DIV <= 0;

                RPM_DEBOUNCE <= RPM_DEBOUNCE(6 downto 0) & RPM_SYNC(1);
                if RPM_CLK_CNT < 65535 then
                    RPM_CLK_CNT <= RPM_CLK_CNT + 1;
                end if;

                -- Stale timeout: no pulse for >5 s
                if RPM_CLK_CNT >= 5000 then
                    RPM_OUT_SIG <= (others => '0');
                end if;

                -- Rising edge: all 8 bits high after stable low
                if RPM_DEBOUNCE = X"FF" then
                    if RPM_STABLE = '0' then
                        RPM_OUT_SIG <= std_logic_vector(to_unsigned(RPM_CLK_CNT, 16));
                        RPM_CLK_CNT <= 0;
                        RPM_STABLE  <= '1';
                    end if;
                -- Falling edge: all 8 bits low rearms detection
                elsif RPM_DEBOUNCE = X"00" then
                    RPM_STABLE <= '0';
                end if;
            end if;
        end if;
    end if;
end process;

-- Brushless Logic
process(clk_div, en) 
begin
    if rising_edge(clk_div) then
        if (en = '1') then
            if in_startup_sync = '1' then
                INLA <= '1';
                INHB <= '1';
                INLB <= '1';
            else 
                if step = 1 then
                    INLA <= '1';
                    INHB <= '1';
                    INLB <= '0';
                elsif step = 2 then
                    INLA <= '1';
                    INHB <= '0';
                    INLB <= '0';
                elsif step = 3 then
                    INLA <= '1';
                    INHB <= '0';
                    INLB <= '1';
                elsif step = 4 then
                    INLA <= '0';
                    INHB <= '0';
                    INLB <= '1';
                elsif step = 5 then
                    INLA <= '0';
                    INHB <= '1';
                    INLB <= '1';
                elsif step = 6 then
                    INLA <= '0';
                    INHB <= '1';
                    INLB <= '0';
                end if;
              end if;
            
            -- Increment step 
         if in_startup_sync = '0' then
            if step >= 6 then
                step <= 1;
            else
                step <= step + 1;
            end if;
         end if;
         
        else 
            INLA <= '0';
            INHB <= '0';
            INLB <= '0';
            step <= 1;
        end if; 
    end if;    
end process; 
        
RPM_Out <= RPM_OUT_SIG;
INHA <= pwm_signal;
INHC <= '0'; --DIR
INLC <= '1';
en_spindle <= en;

end Behavioral;