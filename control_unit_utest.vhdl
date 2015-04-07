LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_alu_utest is
end entity generic_alu_utest;

architecture generic_alu_utest of generic_alu_utest is

	-- SIGNALS

	signal A: std_logic_vector(15 downto 0) := "0000000000000000";
	signal B: std_logic_vector(15 downto 0) := "0000000100000000";
	signal SEL: std_logic_vector(1 downto 0) := "00";
	signal O: std_logic_vector(15 downto 0) := "0000000000000000";

begin

	-- INSTANCE

	DUT : entity WORK.generic_alu (generic_alu) port map (A, B, SEL, O);

	-- CASES

	SEL <= "01" after 10 ns, "10" after 20 ns, "11" after 30 ns;
	A <= "1001000100000011" after 1 ns, "0000000000000000" after 2 ns, "1010101010101010" after 3 ns,
			"0000000011000000" after 4 ns, "0111111111111111" after 5 ns, "1001001001001001" after 6 ns,
			"1111111111111111" after 7 ns, "1000000000000000" after 8 ns, "1000000000000000" after 9 ns,
			"1001000100000011" after 11 ns, "0000000000000000" after 12 ns, "1010101010101010" after 13 ns,
			"0000000011000000" after 14 ns, "0111111111111111" after 15 ns, "1001001001001001" after 16 ns,
			"1111111111111111" after 17 ns, "1000000000000000" after 18 ns, "1000000000000000" after 19 ns,
			"1001000100000011" after 21 ns, "0000000000000000" after 22 ns, "1010101010101010" after 23 ns,
			"0000000011000000" after 24 ns, "0111111111111111" after 25 ns, "1001001001001001" after 26 ns,
			"1111111111111111" after 27 ns, "1000000000000000" after 28 ns, "1000000000000000" after 29 ns;
	B <= "0000000100000000" after 1 ns, "1111111111111111" after 2 ns, "0101010101010101" after 3 ns,
			"0000000001000000" after 4 ns, "0000000000000001" after 5 ns, "0000000010000000" after 6 ns,
			"0000000000000001" after 7 ns, "0000000000000001" after 8 ns, "1000000000000001" after 9 ns,
			"0000000100000000" after 11 ns, "1111111111111111" after 12 ns, "0101010101010101" after 13 ns,
			"0000000001000000" after 14 ns, "0000000000000001" after 15 ns, "0000000010000000" after 16 ns,
			"0000000000000001" after 17 ns, "0000000000000001" after 18 ns, "1000000000000001" after 19 ns,
			"0000000100000000" after 21 ns, "1111111111111111" after 22 ns, "0101010101010101" after 23 ns,
			"0000000001000000" after 24 ns, "0000000000000001" after 25 ns, "0000000010000000" after 26 ns,
			"0000000000000001" after 27 ns, "0000000000000001" after 28 ns, "1000000000000001" after 29 ns;

end architecture generic_alu_utest;