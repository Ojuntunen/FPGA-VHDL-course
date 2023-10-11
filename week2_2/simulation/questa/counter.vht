LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY counter_vhd_tst IS
END counter_vhd_tst;
ARCHITECTURE counter_arch OF counter_vhd_tst IS
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT counter
    PORT (
    CLOCK_50 : IN STD_LOGIC;
    HEX0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    HEX1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END COMPONENT;
BEGIN
    i1 : counter
    PORT MAP (
    CLOCK_50 => CLOCK_50,
    HEX0 => HEX0,
    HEX1 => HEX1
    );

init : PROCESS
BEGIN
WAIT;
END PROCESS init;

clock_process : PROCESS
BEGIN
CLOCK_50 <= '0';
wait for 10 ns;
CLOCK_50 <= '1';
wait for 10 ns;
end process clock_process;


always : PROCESS
BEGIN
WAIT;
END PROCESS always;
END counter_arch;
