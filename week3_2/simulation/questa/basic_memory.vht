LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY basic_memory_vhd_tst IS
END basic_memory_vhd_tst;
ARCHITECTURE basic_memory_arch OF basic_memory_vhd_tst IS
SIGNAL i_addr : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL i_clock : STD_LOGIC := '0';
SIGNAL i_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL i_read : STD_LOGIC := '1'; --KEY0
SIGNAL i_write : STD_LOGIC := '1'; --KEY1
SIGNAL o_addr : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL o_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT basic_memory
    PORT (
    i_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    i_clock : IN STD_LOGIC;
    i_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    i_read : IN STD_LOGIC;
    i_write : IN STD_LOGIC;
    o_addr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    o_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END COMPONENT;
BEGIN
    i1 : basic_memory
    PORT MAP (
    i_addr => i_addr,
    i_clock => i_clock,
    i_data => i_data,
    i_read => i_read,
    i_write => i_write,
    o_addr => o_addr,
    o_data => o_data
    );

clock : PROCESS
BEGIN
i_clock <= '0';
wait for 10 ns;
i_clock <= '1';
wait for 10 ns;
END PROCESS clock;

always : PROCESS
BEGIN
-- write to addr 00
i_addr <= "00";
i_data <= "01010101";
    wait for 20 ns;
i_write <= '0';
    wait for 20 ns;
i_write <= '1';
    wait for 20 ns;
-- read from addr 00
i_read <= '0';
    wait for 20 ns;
i_read <= '1';
    wait for 20 ns;

-- write to addr 01
i_addr <= "01";
i_data <= "11110000";
    wait for 20 ns;
i_write <= '0';
    wait for 20 ns;
i_write <= '1';
    wait for 20 ns;
-- read from addr 01
i_read <= '0';
    wait for 20 ns;
i_read <= '1';
    wait for 20 ns;

WAIT;
END PROCESS always;
END basic_memory_arch;
