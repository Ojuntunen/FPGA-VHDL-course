library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity blink is
port
(
clock_50 : in 	STD_LOGIC; -- 50 MHz clock
LED		: out	STD_LOGIC
);
end blink;

architecture clock_divider of blink is

signal count 		: INTEGER range 0 to 50000000 := 0;
signal state 	: STD_LOGIC:='0';
constant division : INTEGER:=50000000;

begin




clock_cycle:
process (clock_50) is
begin
if rising_edge(clock_50) then
	count <= count + 1;
	if (count = division) then
		state <= not state;
		count <= 0;
	end if;
end if;
LED <= state;
end process clock_cycle;

end clock_divider;