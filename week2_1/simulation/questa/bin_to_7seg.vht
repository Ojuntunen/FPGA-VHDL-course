LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY bin_to_7seg_vhd_tst IS
END bin_to_7seg_vhd_tst;
ARCHITECTURE bin_to_7seg_arch OF bin_to_7seg_vhd_tst IS
SIGNAL clock_50 : STD_LOGIC := '0';
SIGNAL HEX0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT bin_to_7seg
    PORT (
    clock_50 : IN STD_LOGIC;
    HEX0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END COMPONENT;
BEGIN
    i1 : bin_to_7seg
    PORT MAP (
-- list connections between master ports and signals
    clock_50 => clock_50,
    HEX0 => HEX0,
    SW => SW
    );
init : PROCESS
-- variable declarations
BEGIN
WAIT;
END PROCESS init;

clock_process : PROCESS BEGIN
clock_50 <= '0';
wait for 10 ns;
clock_50 <= '1';
wait for 10 ns;
end process;


always : PROCESS BEGIN
wait for 60 ns;
for i in 0 to 15 loop
	SW <= std_logic_Vector(to_unsigned(i, SW'length));
	wait for 20 ns;
end loop;

WAIT;
END PROCESS always;
END bin_to_7seg_arch;
