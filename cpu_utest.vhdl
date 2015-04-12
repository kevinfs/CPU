LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity cpu_utest is
end entity cpu_utest;

architecture cpu_utest of cpu_utest is

	-- SIGNALS

	signal DATA_IN: std_logic_vector(15 downto 0) := "0000000000000000";
	signal RUN, RESET, CLOCK: std_logic := '0';

begin

	-- INSTANCE

	DUT : entity WORK.cpu (cpu) port map (DATA_IN, RUN, RESET, CLOCK);

	-- CASES
	RUN <= '1';
	RESET <= '1' after 0.6 ns, '0' after 1.5 ns;
	CLOCK <= '1' after 1 ns, '0' after 1.5 ns, '1' after 2 ns, '0' after 3 ns, '1' after 4 ns, '0' after 5 ns,
				'1' after 6 ns, '0' after 7 ns, '1' after 8 ns, '0' after 9 ns,
				'1' after 10 ns, '0' after 11 ns, '1' after 12 ns, '0' after 13 ns,
				'1' after 14 ns, '0' after 15 ns, '1' after 16 ns, '0' after 17 ns,
				'1' after 18 ns, '0' after 19 ns, '1' after 20 ns, '0' after 21 ns,
				'1' after 22 ns, '0' after 23 ns, '1' after 24 ns, '0' after 25 ns,
				'1' after 26 ns, '0' after 27 ns, '1' after 28 ns, '0' after 29 ns,
				'1' after 30 ns, '0' after 31 ns, '1' after 32 ns, '0' after 33 ns,
				'1' after 34 ns, '0' after 35 ns, '1' after 36 ns, '0' after 37 ns;
	DATA_IN <= 	"0000000101001000" after 1 ns, "0000000000000001" after 5 ns, -- MVI R1 1
				"0000000101000000" after 16 ns, "0000000000000010" after 22 ns,
				"0000000100010000" after 32 ns; -- MVI R0 2

end architecture cpu_utest;