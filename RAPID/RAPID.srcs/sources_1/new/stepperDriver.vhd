library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stepperDriver is
    Port (clk: in std_logic; -- 125MHz
        dir: in std_logic; -- direction
        dir_out : out std_logic;
        en: in std_logic; -- enable
        pwm_out_step : out std_logic;
        prox_in : in std_logic;
        zero_req : in std_logic; -- '1' to request re-zero of sled
        en_out : out std_logic; --enable signal sent to DRV8834's sleep pin
        num_steps : in std_logic_vector(20 downto 0); --number of steps to run motor for -1,048,576
        step_go : in std_logic; -- logic '1' to begin steps
        M : inout std_logic_vector(1 downto 0);
        step_total_out : out std_logic_vector(20 downto 0);
        M_in : in std_logic_vector(3 downto 0));
end stepperDriver;

architecture Behavioral of stepperDriver is
--constants for clock and clock dividers
constant base_clk : integer := 125000000;
signal run_freq : integer := 125000; --set for 1kHz for testing
signal zero_freq : integer := 12500000; --set 10 Hz for zeroing process
--state logic for zero mode vs normal
type state_t is (ZEROING, IDLE, WAKEUP, RUNNING, DONE);
signal state : state_t := ZEROING;

--normal running counter
signal run_counter : integer range 0 to base_clk := 0;
signal run_clk : std_logic := '0';
signal run_clk_prev: std_logic := '0';
signal steps_remaining : integer range 0 to 1000000 := 0;
signal step_go_prev : std_logic := '0';

--prox switch debounce
signal prox_debounce_count : integer range 0 to 1250000 := 0; --10ms button debounce check
signal prox_stable : std_logic := '0';
--synchronized 2 FF input for metastability
signal prox_sync1 : std_logic := '0';
signal prox_sync2 : std_logic := '0';


--zeroing counter
signal zero_counter : integer range 0 to base_clk := 0;
signal zero_clk : std_logic := '0';
signal zero_req_prev : std_logic := '0'; --previous state to prevent inadvertent bounce
--signals for outputs
signal pwm_sig : std_logic := '0';
signal dir_sig : std_logic := '0';
signal en_sig : std_logic := '0';
signal wakeup_counter : integer range 0 to 150001 := 0; --wakeup counter from exiting sleep mode

-- convert std_logic_vector port to integer for internal use
signal num_steps_int : integer range 0 to 1000000 := 0;
signal step_total : integer range 0 to 100000000 := 0; --counter to keep track of sled position
signal M_val   : std_logic_vector(1 downto 0) := "00";
signal M_en    : std_logic_vector(1 downto 0) := "11"; -- '1'=drive, '0'=tristate

--Have vivado place prox_sync1 and prox_sync2 near each other in same slice - minimize routing delay
--Also prevents optimizing flipflops away
attribute ASYNC_REG : string;
attribute ASYNC_REG of prox_sync1 : signal is "TRUE";
attribute ASYNC_REG of prox_sync2 : signal is "TRUE";

begin

num_steps_int <= to_integer(unsigned(num_steps));


--assign M based on user input
process(M_in)
begin
    case M_in is
        when "0000" =>              -- full step
            run_freq  <= 500000;
            zero_freq <= 12500000;
            M_val     <= "00";
            M_en      <= "11";      -- both driven

        when "0010" =>              -- 1/8 step
            run_freq  <= 62500;
            zero_freq <= 1562500;
            M_val     <= "01";
            M_en      <= "11";

        when "1000" =>              -- 1/2 step
            run_freq  <= 250000;
            zero_freq <= 6250000;
            M_val     <= "10";
            M_en      <= "11";

        when "1010" =>              -- 1/16 step
            run_freq  <= 31250;
            zero_freq <= 781250;
            M_val     <= "11";
            M_en      <= "11";

        when "1100" =>              -- 1/4 step (M[1]=hi-Z, M[0]=low)
            run_freq  <= 125000;
            zero_freq <= 3125000;
            M_val     <= "00";      -- M[0] driven low, M[1] value irrelevant
            M_en      <= "01";      -- only M[0] driven, M[1] tristated

        when "1011" =>              -- 1/32 step (M[1]=high, M[0]=hi-Z)
            run_freq  <= 15625;
            zero_freq <= 390625;
            M_val     <= "10";      -- M[1] driven high, M[0] value irrelevant
            M_en      <= "10";      -- only M[1] driven, M[0] tristated

        when others =>              -- fallback
            run_freq  <= 500000;
            zero_freq <= 12500000;
            M_val     <= "00";
            M_en      <= "11";
    end case;
end process;


--normal run clock div
process(clk)
begin
        
    if rising_edge(clk) then
        if run_counter < (run_freq/2) then
            run_clk <= '0';
            run_counter <= run_counter + 1;
        elsif (run_counter >= (run_freq/2)) and (run_counter < run_freq) then 
            run_clk <= '1';
            run_counter <= run_counter + 1;
        else
            run_clk <= '0';
            run_counter <= 0;
        end if;
        
     end if;
end process;

--sled zero clock div (1hz)
process(clk)
begin
    
    if rising_edge(clk) then
        if zero_counter < (zero_freq / 2) then
            zero_clk <= '0';
            zero_counter <= zero_counter + 1;
        elsif (zero_counter >= (zero_freq/2)) and (zero_counter < zero_freq) then
            zero_clk <= '1';
            zero_counter <= zero_counter + 1;
        else
            zero_clk <= '0';
            zero_counter <= 1;
        end if;
        
    end if;
end process;

--proximity switch 2FF delay - metastability 
process(clk)
begin
    if rising_edge(clk) then
        prox_sync1 <= prox_in;
        prox_sync2 <= prox_sync1;
        end if;
end process;
    

--button debounce logic
process(clk)
begin
    if rising_edge(clk) then
        if prox_sync2 ='1' then
            if prox_debounce_count < 1250000 then --10 mS wait before triggering '1'
                prox_debounce_count <= prox_debounce_count + 1;
            else 
                prox_stable <= '1';
            end if;
         else
            prox_debounce_count <= 0;
            prox_stable <= '0';
         end if;
     end if;
end process;

--state machine logic
process(clk)
begin
    if rising_edge(clk) then
        --track previous values for run_clk and step
        run_clk_prev <= run_clk;
        step_go_prev <= step_go;
        zero_req_prev <= zero_req;
    
    case state is
        when ZEROING =>
            dir_sig <= '0'; --drive towards spindle
            en_sig <= '1';
            if en ='1' then
                pwm_sig <= zero_clk;
            else
                pwm_sig <= '0';
            end if;
            
            if prox_stable = '1' then
            step_total <= 0;
                state <= IDLE;
            end if;
            
       when IDLE =>
            pwm_sig <= '0';
            dir_sig <= dir;
            en_sig <= '0';
            --detect rising edge of step_go
            if step_go ='1' and step_go_prev = '0' then
                if num_steps_int > 0 and en = '1' then
                    wakeup_counter <= 0;
                    steps_remaining <= num_steps_int;
                    state <= WAKEUP;
                end if;
            end if;
            --rezero if requested
            if zero_req = '1' and zero_req_prev = '0' then
                state <= ZEROING;
            end if;
            
       when WAKEUP =>
        en_sig <= '1';
        pwm_sig <= '0';
        if wakeup_counter < 150000 then
            wakeup_counter <= wakeup_counter + 1;
        else 
            wakeup_counter <= 0;
            state <= RUNNING;
        end if;
            
       --output run_clk, count # of steps (pulses)
       when RUNNING =>
        en_sig <= '1';
        dir_sig <= dir;
        if en = '0' then
            --switch to idle if disabled mid-move
            pwm_sig <= '0';
            state <= IDLE;
        elsif steps_remaining = 0 then
            pwm_sig <= '0';
            state <= DONE;
        else
            pwm_sig<=run_clk;
            --count step on each falling edge of run_clk - decrement after full pulse
            if run_clk = '0' and run_clk_prev = '1' then
                steps_remaining <= steps_remaining - 1;
                if dir ='1' then
                    step_total <= step_total + 1;
                else 
                    step_total <= step_total -1;
                end if;
            end if; 
        end if;
        
        if zero_req = '1' and zero_req_prev = '0' then
            pwm_sig <= '0';
            state <= ZEROING;
        end if;
        
        when DONE =>
            pwm_sig <= '0';
            dir_sig <= dir; 
            en_sig <= '0'; --place motor driver in sleep mode
            if step_go = '1' and step_go_prev = '0' then
                if num_steps_int > 0 and en = '1' then
                    steps_remaining <= num_steps_int;
                    wakeup_counter <= 0;
                    state <= WAKEUP;
                end if;
            end if;
            
            if zero_req = '1' and zero_req_prev = '0' then
                state <= ZEROING;
            end if;
        
        end case;
     end if;
end process;
        
--assign M value - tristate output assignment
M(1) <= M_val(1) when M_en(1) = '1' else 'Z';
M(0) <= M_val(0) when M_en(0) = '1' else 'Z';

pwm_out_step <= pwm_sig;
dir_out <= dir_sig;
en_out <= en_sig;


end Behavioral;
