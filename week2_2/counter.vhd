library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter is
port(
    CLOCK_50        : in    STD_LOGIC; --50 MHz clock
    HEX0            : out   STD_LOGIC_VECTOR(7 downto 0); -- 7-segment display 0
    HEX1            : out   STD_LOGIC_VECTOR(7 downto 0)  -- 7-segment display 1
);
end entity;

architecture behaviour of counter is

subtype DIGIT_TYPE is INTEGER range 0 to 9;
type DIGITS_TYPE is ARRAY (1 downto 0) of DIGIT_TYPE;
signal DIGIT            : DIGIT_TYPE;
signal DIGITS           : DIGITS_TYPE;
signal COUNT            : INTEGER range 0 to 60 := 0;
signal CLOCK_CYCLES     : INTEGER range 0 to 50e6 := 0;
constant CLOCK_DIVIDER  : INTEGER := 50e6;

begin

process (CLOCK_50) is 
    begin
    if rising_edge(CLOCK_50) then
        CLOCK_CYCLES <= CLOCK_CYCLES + 1;
        if (CLOCK_CYCLES = CLOCK_DIVIDER) then
            if (COUNT = 60) then
                COUNT <= 1;
            else
                COUNT <= COUNT + 1;
            end if;

            DIGITS(1) <= (COUNT / 10);
            DIGITS(0) <= COUNT - (COUNT / 10) * 10;
            CLOCK_CYCLES <= 0;
        end if;
    end if;
end process;


process (CLOCK_50) is
    begin
        case DIGITS(0) is
            when 0 => HEX0 <= "11000000";
            when 1 => HEX0 <= "11111001";
            when 2 => HEX0 <= "10100100";
            when 3 => HEX0 <= "10110000";
            when 4 => HEX0 <= "10011001";
            when 5 => HEX0 <= "10010010";
            when 6 => HEX0 <= "10000010"; 
            when 7 => HEX0 <= "11111000";
            when 8 => HEX0 <= "10000000";
            when 9 => HEX0 <= "10010000";
            when others => HEX0 <= "11111111";
        end case;
end process;

process (CLOCK_50) is
    begin
        case DIGITS(1) is
            when 0 => HEX1 <= "11000000";
            when 1 => HEX1 <= "11111001";
            when 2 => HEX1 <= "10100100";
            when 3 => HEX1 <= "10110000";
            when 4 => HEX1 <= "10011001";
            when 5 => HEX1 <= "10010010";
            when 6 => HEX1 <= "10000010"; 
            when 7 => HEX1 <= "11111000";
            when 8 => HEX1 <= "10000000";
            when 9 => HEX1 <= "10010000";
            when others => HEX1 <= "11111111";
        end case;
end process;

end architecture;