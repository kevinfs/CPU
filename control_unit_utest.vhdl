LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity control_unit_utest is
end entity control_unit_utest;

architecture control_unit_utest of control_unit_utest is

	-- SIGNALS

	signal INSTRUCTION: std_logic_vector(8 downto 0) := "000000000";
	signal RUN: std_logic := '0';
	signal RESET: std_logic := '0';
	signal CLOCK: std_logic := '0';

begin

	-- INSTANCE

	DUT : entity WORK.control_unit (control_unit) port map (INSTRUCTION, RUN, RESET, CLOCK);

	-- CASES

	CLOCK <= '0' after 1 ns, '1' after 2 ns, '0' after 3 ns, '1' after 4 ns, '0' after 5 ns,
				'1' after 6 ns, '0' after 7 ns, '1' after 8 ns, '0' after 9 ns,
				'1' after 10 ns, '0' after 11 ns, '1' after 12 ns, '0' after 13 ns,
				'1' after 14 ns, '0' after 15 ns, '1' after 16 ns, '0' after 17 ns,
				'1' after 18 ns, '0' after 19 ns, '1' after 20 ns, '0' after 21 ns,
				'1' after 22 ns, '0' after 23 ns, '1' after 24 ns, '0' after 25 ns,
				'1' after 26 ns, '0' after 27 ns, '1' after 28 ns, '0' after 29 ns;
	RUN <= '1' after 1 ns;
	--RESET <= '1' after 8 ns, '0' after 9 ns;
	INSTRUCTION <= "101001010" after 1 ns, "000001010" after 9 ns, "101001010" after 15 ns;

end architecture control_unit_utest;