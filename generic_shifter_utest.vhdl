LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_shifter_utest is
end entity generic_shifter_utest;

architecture generic_shifter_utest of generic_shifter_utest is

	-- SIGNALS

	signal A: std_logic_vector(15 downto 0) := "0000000000000000";
	signal O: std_logic_vector(15 downto 0) := "0000000000000000";

begin

	-- INSTANCE

	DUT : entity WORK.generic_shifter (generic_shifter) port map (A, O);

	-- CASES

	A <= "0000000000000001" after 1 ns, "0110001110000000" after 2 ns, "1000000000000000" after 3 ns,
			"1111111111111111" after 4 ns, "1010101010101010" after 5 ns, "1100110011001100" after 6 ns;

end architecture generic_shifter_utest;