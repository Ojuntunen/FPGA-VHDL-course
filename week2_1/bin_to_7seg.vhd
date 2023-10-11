library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- needed:
-- switch inputs
-- 7-segment display outputs
-- signal to hold the output value (8-bit STD_LOGIC_VECTOR) | *Is this really necessary? Can you just assign straight to LED? Does it matter for test bench?*
-- process to run the logic
-- lookup table for binary to 7-seg (use case statement)

entity bin_to_7seg is
port(
    clock_50    : in    STD_LOGIC;
    SW          : in    STD_LOGIC_VECTOR(3 downto 0);
    HEX0        : out   STD_LOGIC_VECTOR(7 downto 0)
);

end entity;

architecture behaviour of bin_to_7seg is

begin

process (clock_50) is begin
if rising_edge(clock_50) then
    case SW is
        when "0000" =>      HEX0 <= "11000000"; --0
        when "0001" =>      HEX0 <= "11111001"; --1 
        when "0010" =>      HEX0 <= "10100100"; --2
        when "0011" =>      HEX0 <= "10110000"; --3
        when "0100" =>      HEX0 <= "10011001"; --4
        when "0101" =>      HEX0 <= "10010010"; --5
        when "0110" =>      HEX0 <= "10000010"; --6
        when "0111" =>      HEX0 <= "11111000"; --7
        when "1000" =>      HEX0 <= "10000000"; --8
        when "1001" =>      HEX0 <= "10010000"; --9
        when "1010" =>      HEX0 <= "10001000"; --A
        when "1011" =>      HEX0 <= "10000011"; --B
        when "1100" =>      HEX0 <= "11000110"; --C
        when "1101" =>      HEX0 <= "10100001"; --D
        when "1110" =>      HEX0 <= "10000110"; --E
        when "1111" =>      HEX0 <= "10001110"; --F
        when others =>      HEX0 <= "01111111"; --dot/error
    end case;
    
end if;
end process;

end architecture;