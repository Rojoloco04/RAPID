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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Spindle is
    Port (  clk : in STD_LOGIC; -- 125 MHz
            en : in STD_LOGIC; --enable 
            dir : in STD_LOGIC; --motor direction; "0" forward, "1" backwards
            speed : in STD_LOGIC_VECTOR(1 downto 0); -- speed control 4 options
            PhA, PhB, PhC : out STD_LOGIC_VECTOR(1 downto 0)); -- "10" is 1, "00" is 0, and "01" is -1
end Spindle;

architecture Behavioral of Spindle is
signal counter : integer range 0 to 25001 := 0; -- counter for clk
signal count_max : integer range 2499 to 25001 := 4166; --counter for the max of the clk 
signal clk_div : std_logic := '0'; --clk divider



begin

-- Different Speeds
count_max <= 4166 when (speed = "00") else -- 30 kHz
             2500 when (speed = "01") else -- 50 kHz
             12500 when (speed = "10") else --10 kHz
             25000; --5 kHz
             
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

-- Brushless Logic
process(clk_div, en) 
variable step : integer range 0 to 6 := 1;
begin
    if rising_edge(clk_div) then
    -- "10" is 1, "00" is 0, and "01" is -1
    --Clockwise Direction
    if (en = '1') then
        if (dir = '0') then
            if step = 1 then
                PhA <= "10";
                PhB <= "01";
                PhC <= "00";
            elsif step = 2 then
                PhA <= "10";
                PhB <= "00";
                PhC <= "01";
            elsif step = 3 then
                PhA <= "00";
                PhB <= "10";
                PhC <= "01";
            elsif step = 4 then
                PhA <= "01";
                PhB <= "10";
                PhC <= "00";
            elsif step = 5 then
                PhA <= "01";
                PhB <= "00";
                PhC <= "10";
            elsif step = 6 then
                PhA <= "00";
                PhB <= "01";
                PhC <= "10";
                step := 0;
            end if;
            --CCW direction
          elsif (dir = '1') then
            if step = 1 then
                PhA <= "00";
                PhB <= "01";
                PhC <= "10";
            elsif step = 2 then
                PhA <= "01";
                PhB <= "00";
                PhC <= "10";
            elsif step = 3 then
                PhA <= "01";
                PhB <= "10";
                PhC <= "00";
            elsif step = 4 then
                PhA <= "00";
                PhB <= "10";
                PhC <= "01";
            elsif step = 5 then
                PhA <= "10";
                PhB <= "00";
                PhC <= "01";
            elsif step = 6 then
                PhA <= "10";
                PhB <= "01";
                PhC <= "00";
                step := 0;
           end if;
        end if;
            step := step + 1;
        
        else 
        PhA <= "00";
        PhB <= "00";
        PhC <= "00";
    end if;     
    end if;
end process; 

end Behavioral;

