library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity parallel_to_serial is
port
(
    clock_50        :   in  STD_LOGIC;
    i_push_button   :   in  STD_LOGIC;
    i_parallel      :   in  STD_LOGIC_VECTOR(7 downto 0); -- parellel input switches
    o_serial        :   out STD_LOGIC
);

end entity;

architecture behaviour of parallel_to_serial is

signal      transmitting        : STD_LOGIC := '0';
signal      delay_done          : STD_LOGIC := '0';
signal      clock_counter       : INTEGER range 0 to 50E6 := 0;
constant    CYCLES_IN_1_SEC     : INTEGER := 50e6;
signal      data                : STD_LOGIC_VECTOR(7 downto 0);
signal      current_bit         : INTEGER range 0 to 7;

begin

    delay : process (clock_50) is
    begin
        if (rising_edge(clock_50)) then
            delay_done <= '0';
            if (clock_counter < CYCLES_IN_1_SEC) then
                clock_counter <= clock_counter + 1;
            else
                delay_done <= '1';
                clock_counter <= 0;
            end if;
        end if;
    end process delay;

    start : process (clock_50) is
    begin
        if (rising_edge(clock_50)) then
            if (transmitting = '0') then
                if (i_push_button = '0') then
                    transmitting <= '1';
                    current_bit <= 0;
                    data <= i_parallel;
                end if;
            else
                o_serial <= data(current_bit);
                if (delay_done = '1') then
                    current_bit <= current_bit + 1;
                    if (current_bit = 7) then
                        transmitting <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process start;

end architecture;