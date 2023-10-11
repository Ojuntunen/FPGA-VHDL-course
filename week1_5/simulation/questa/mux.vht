LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_vhd_tst IS
END mux_vhd_tst;

ARCHITECTURE mux_arch OF mux_vhd_tst IS
    SIGNAL i_addr : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL i_clock50 : STD_LOGIC := '0';
    SIGNAL i_push_button : STD_LOGIC;
    SIGNAL o_ledr : STD_LOGIC;
    COMPONENT mux
        PORT (
            i_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            i_clock50 : IN STD_LOGIC;
            i_push_button : IN STD_LOGIC;
            o_ledr : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    i1 : mux
    PORT MAP (
    i_addr => i_addr,
    i_clock50 => i_clock50,
    i_push_button => i_push_button,
    o_ledr => o_ledr
    );
init : PROCESS
-- variable declarations
BEGIN
i_clock50 <= not i_clock50 after 10 ns;

WAIT;
END PROCESS init;
always : PROCESS BEGIN
    i_push_button <= '0';
    i_addr <= "00";
    wait for 20 ns;
    i_addr <= "01";
    wait for 20 ns;
    i_addr <= "10";
    wait for 20 ns;
    i_addr <= "11";
    wait for 20 ns;

    i_push_button <= '1';
    i_addr <= "00";
    wait for 20 ns;
    i_addr <= "01";
    wait for 20 ns;
    i_addr <= "10";
    wait for 20 ns;
    i_addr <= "11";
    wait for 20 ns;
WAIT;
END PROCESS always;
END mux_arch;
