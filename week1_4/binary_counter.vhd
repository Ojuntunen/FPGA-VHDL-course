library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity binary_counter is
port
(
	LEDR  : out STD_LOGIC_VECTOR(9 downto 0);
	clock_50 : in  STD_LOGIC
);

end entity;

architecture behaviour of binary_counter is

signal seconds    : STD_LOGIC_VECTOR(9 downto 0);
signal count	   : INTEGER range 0 to 50000000 := 0;
constant division : INTEGER := 50000000;

begin

process (clock_50) is begin
if rising_edge(clock_50) then
    count <= count + 1;
    if (count = division) then
		 if (seconds = "1111111111") then
				seconds <= "0000000000";
		 else 
				seconds <= seconds + 1;
		 end if;
       count <= 0;
    end if;
end if;
LEDR <= seconds;
end process;

end architecture;
		
			