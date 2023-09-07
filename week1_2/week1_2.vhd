library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity week1_2 is
Port ( 
a   		: in  STD_LOGIC_VECTOR (3 downto 0); --First 4 bits (SW0 to SW3)
b   		: in  STD_LOGIC_VECTOR (3 downto 0); --Second 4 bits (SW4 to SW7)
cin 		: in  STD_LOGIC; --Carry-in bit for the first full adder
s			: out STD_LOGIC_VECTOR (3 downto 0); --First four output bits (LEDR0 to LEDR3)
cout 		: out STD_LOGIC; --Carry-out bit for the 4th full adder/5th data bit (LEDR4)
LEDR_XOR : out STD_LOGIC_VECTOR(3 downto 0)
);
end week1_2;

architecture Behavioral of week1_2 is
	
component FA is
port (a, b, c_in	: in 	std_logic;
		s, c_out		: out std_logic);
end component;
signal c: std_logic_vector(4 downto 0);
begin
u1: FA port map (a => a(0), b => b(0), c_in => c(0), s => s(0), c_out => c(1));
u2: FA port map (a => a(1), b => b(1), c_in => c(1), s => s(1), c_out => c(2));
u3: FA port map (a => a(2), b => b(2), c_in => c(2), s => s(2), c_out => c(3));
u4: FA port map (a => a(3), b => b(3), c_in => c(3), s => s(3), c_out => c(4));
c(0) <= cin;
cout <= c(4);
LEDR_XOR <= a XOR b;

end Behavioral;