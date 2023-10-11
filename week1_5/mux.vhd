library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- mux has 4 states, chosen with two switches (i_addr):
-- 00 : o_ledr = 0
-- 01 : o_ledr = i_push_button
-- 10 : o_ledr = not i_push_button
-- 11 : o_ledr = 1

entity mux is
    port(
        i_clock50       : in    STD_LOGIC;
        i_addr          : in    STD_LOGIC_VECTOR(1 downto 0); --switches
        i_push_button   : in    STD_LOGIC;
        o_ledr          : out   STD_LOGIC
    );

end entity;

architecture behaviour of mux is

begin
    process (i_clock50) is begin
        if (rising_edge(i_clock50)) then
            case i_addr is
                when "00" =>
                    o_ledr <= '0';
                when "10" =>
                    o_ledr <= i_push_button;
                when "01" =>
                    o_ledr <= not i_push_button;
                when "11" =>
                    o_ledr <= '1';
                when others =>
                    o_ledr <= '0';
            end case;
        end if;

    end process;

end architecture;