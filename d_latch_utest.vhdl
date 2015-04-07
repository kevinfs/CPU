LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity d_latch_utest is
end entity d_latch_utest;

architecture d_latch_utest of d_latch_utest is

	-- SIGNALS

	signal I: std_logic := '0';
	signal W: std_logic := '0';
	signal O: std_logic := '0';

begin

	-- INSTANCE

	DUT : entity WORK.d_latch (d_latch) port map (I, W, O);

	-- CASES

	I <= '1' after 2 ns, '0' after 5 ns, '1' after 7 ns;
	W <= '1' after 3 ns, '0' after 4 ns, '1' after 6 ns;

end architecture d_latch_utest;