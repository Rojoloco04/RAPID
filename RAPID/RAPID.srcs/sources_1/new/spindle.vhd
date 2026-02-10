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

entity Spindle is
    Port (  clk : in STD_LOGIC; -- 125 MHz
            en : in STD_LOGIC; --enable 
            en_spindle : out STD_LOGIC; --enable for DRV8323
            dir : in STD_LOGIC; --motor direction; "0" forward, "1" backwards
            speed : in STD_LOGIC_VECTOR(1 downto 0); -- speed control 4 options
            kill : in STD_LOGIC; --safety kill switch
            INHA : out STD_LOGIC;  -- PWM input
            INLA : out STD_LOGIC;  -- State input 
            INHB : out STD_LOGIC;  -- State input 
            INLB : out STD_LOGIC;  -- State input 
            INHC : out STD_LOGIC;  -- Direction control
            INLC : out STD_LOGIC); -- Brake control (tie high normally)is 1
end Spindle;

architecture Behavioral of Spindle is
signal counter : integer range 0 to 20000000 := 0;
signal count_max : integer range 500 to 250000000 := 625000;
signal clk_div : std_logic := '0';
signal step : integer range 1 to 6 := 1;
signal pwm_counter : integer range 0 to 12501 := 0;
signal pwm_signal : std_logic := '0';
signal duty_cycle : integer range 0 to 12501 := 6250; -- 100% default

begin

-- Different Speeds 
--count_max <= 200000 when (speed = "00") else  -- Slowest
--             100000 when (speed = "01") else  
--             50000 when (speed = "10") else   
--             25000;                           -- Fastest
count_max <= 625000; --25Hz
-- clk divider
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


-- PWM Generator @ ~10kHz
process(clk)
begin
    if rising_edge(clk) then
        if pwm_counter < 6250 then
            pwm_counter <= pwm_counter + 1;
        else
            pwm_counter <= 0;
        end if;
        
        if pwm_counter < duty_cycle then
            pwm_signal <= '1';
        else
            pwm_signal <= '0';
        end if;
    end if;
end process;

-- Duty cycle control 
duty_cycle <= 1562 when (speed = "00") else  -- 25%
             3125 when (speed = "01") else   --50%
             4688 when (speed = "10") else   --75%
             6250; --100%


-- Brushless Logic
process(clk_div, en) 
begin
    if rising_edge(clk_div) then
        if (en = '1' and kill='0') then
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
               
            
            -- Increment step 
            if step >= 6 then
                step <= 1;
            else
                step <= step + 1;
            end if;
            
        else 
            INLA <= '0';
            INHB <= '0';
            INLB <= '0';
            step <= 1;
        end if; 
    end if;    
end process; 

INHA <= pwm_signal;
INHC <= dir;
INLC <= '1';
en_spindle <= '1';

end Behavioral;