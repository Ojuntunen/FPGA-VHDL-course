library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity basic_memory is
    port
    (
        i_clock     : in  STD_LOGIC;
        i_addr      : in  STD_LOGIC_VECTOR(1 downto 0);
        i_data      : in  STD_LOGIC_VECTOR(7 downto 0);
        i_write     : in  STD_LOGIC;
        i_read      : in  STD_LOGIC;
        o_addr      : out STD_LOGIC_VECTOR(1 downto 0);
        o_data      : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity basic_memory;

architecture behaviour of basic_memory is
    
    SUBTYPE t_word    is STD_LOGIC_VECTOR(7 downto 0);
    TYPE    t_memory  is ARRAY(3 downto 0) of t_word;
    SIGNAL  memory      : t_memory;
    SIGNAL  r_addr      : INTEGER range 0 to 3;

begin

process (i_clock) is
begin
    if (rising_edge(i_clock)) then
        o_addr <= i_addr;
        r_addr <= to_integer(UNSIGNED(i_addr));
        if (i_write = '0') then
            memory(r_addr) <= i_data;
        elsif (i_read = '0') then
            o_data <= memory(r_addr);
        end if;
    end if;

end process;


end architecture behaviour;