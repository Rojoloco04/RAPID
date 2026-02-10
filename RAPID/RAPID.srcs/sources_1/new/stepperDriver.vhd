library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stepperDriver is
    Port (clk: in std_logic; -- 150MHz
        dir: in std_logic; -- direction
        en: in std_logic; -- enable
        phA1, phB1: out std_logic; -- coil 1
        phA2, phB2: out std_logic; -- coil 2
        reset: in std_logic);
end stepperDriver;

architecture Behavioral of stepperDriver is
signal PS, NS: std_logic_vector(1 downto 0) := "00";
signal clk_div: std_logic :='0';
signal counter : integer range 0 to 1001 := 0;
signal count_max : integer range 500 to 1001 := 1000;

begin

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
-- state register
process(clk_div)
begin
if rising_edge(clk_div) then
    if reset = '1' then
        PS <= "00";
    else
        PS <= NS;
    end if;
end if;
end process;

-- next state logic
process(dir, PS, reset)
begin
if en = '1' then
    if reset = '1' then
        NS <= "00";
    elsif dir = '1' then
        if PS = "00" then NS <= "01";
        elsif PS = "01" then NS <= "11";
        elsif PS = "11" then NS <= "10";
        elsif PS = "10" then NS <= "00";
        end if;
    elsif dir = '0' then
        if PS = "00" then NS <= "10";
        elsif PS = "01" then NS <= "00";
        elsif PS = "11" then NS <= "01";
        elsif PS = "10" then NS <= "11";
        end if;
    end if;
end if;
end process;

--output logic
phA1 <= PS(1);
phB1 <= PS(0);
phA2 <= not PS(1);
phB2 <= not PS(0);

end Behavioral;
