-- UFMG
-- 05/12/2023
-- Ricardo de Oliveira Duarte
-- A 4-bit synchronous counter, with synchronous reset, synchronous parallel load, load signal control, and start_count signal control.

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity SyncCounter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           load : in STD_LOGIC;
           start_count : in STD_LOGIC;
           parallel_data : in STD_LOGIC_VECTOR(3 downto 0);
           count : out STD_LOGIC_VECTOR(3 downto 0));
end SyncCounter;

architecture Behavioral of SyncCounter is
    signal counter_reg : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            counter_reg <= "0000";
        elsif rising_edge(clk) then
            if (start_count = '0' and load = '1') then
                counter_reg <= parallel_data;
            elsif (start_count = '1' and load = '0') then
                counter_reg <= std_logic_vector(unsigned(counter_reg) + 1);
			else 
				counter_reg <= counter_reg;
            end if;
        end if;
    end process;

    count <= counter_reg;
end Behavioral;
