-- UFMG
-- 05/12/2023
-- Ricardo de Oliveira Duarte
-- A Testbench_SyncCounter to a 4-bit synchronous counter, with synchronous reset, synchronous parallel load, load signal control
-- and start_count signal control.

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity Testbench_SyncCounter is
end Testbench_SyncCounter;

architecture Behavioral of Testbench_SyncCounter is
    signal clk_tb, rst_tb, load_tb, start_count_tb : STD_LOGIC := '0';
    signal parallel_data_tb : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal count_tb : STD_LOGIC_VECTOR(3 downto 0);

    constant clk_period : time := 10 ns;  -- Define the clock period

    component SyncCounter
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               load : in STD_LOGIC;
               start_count : in STD_LOGIC;
               parallel_data : in STD_LOGIC_VECTOR(3 downto 0);
               count : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

begin
    uut: SyncCounter
        port map (clk => clk_tb,
                  rst => rst_tb,
                  load => load_tb,
                  start_count => start_count_tb,
                  parallel_data => parallel_data_tb,
                  count => count_tb);

    -- Clock generation process
    process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        rst_tb <= '1';  -- Reset initially
        wait for 20 ns;

        rst_tb <= '0';  -- De-assert reset
        wait for 20 ns;

        load_tb <= '1';  -- Load initial data
        parallel_data_tb <= "1010";
        wait for 20 ns;

        load_tb <= '0';  -- Start counting
        wait for 20 ns;

        start_count_tb <= '1';  -- Enable counting
        wait for 200 ns;

        start_count_tb <= '0';  -- Stop counting
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
