library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stepperDriver is
    Port (clk, dir: in std_logic;
        phA, phB: out std_logic;
        reset: in std_logic;
        en : in std_logic);
end stepperDriver;

architecture Behavioral of stepperDriver is
signal PS, NS: std_logic_vector(1 downto 0) := "00";
begin

-- state register
process(clk)
begin
if rising_edge(clk) then
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
phA <= PS(1);
phB <= PS(0);

end Behavioral;
