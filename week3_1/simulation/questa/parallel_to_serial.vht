LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parallel_to_serial_vhd_tst IS
END parallel_to_serial_vhd_tst;
ARCHITECTURE parallel_to_serial_arch OF parallel_to_serial_vhd_tst IS

SIGNAL clock_50 : STD_LOGIC;
SIGNAL i_parallel : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL i_push_button : STD_LOGIC := '1';
SIGNAL o_serial : STD_LOGIC;
COMPONENT parallel_to_serial
    PORT (
    clock_50 : IN STD_LOGIC;
    i_parallel : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    i_push_button : IN STD_LOGIC;
    o_serial : OUT STD_LOGIC
    );
END COMPONENT;
BEGIN
    i1 : parallel_to_serial
    PORT MAP (
    clock_50 => clock_50,
    i_parallel => i_parallel,
    i_push_button => i_push_button,
    o_serial => o_serial
    );

clock : PROCESS
BEGIN
    clock_50 <= '0';
    wait for 10 ns;
    clock_50 <= '1';
    wait for 10 ns;
end process clock;

init : PROCESS
BEGIN
WAIT;
END PROCESS init;

always : PROCESS
BEGIN
    i_parallel <= "11001010";
    wait for 40 ns;
    i_push_button <= '0';
    wait for 40 ns;
    i_push_button <= '1';
WAIT;
END PROCESS always;
END parallel_to_serial_arch;