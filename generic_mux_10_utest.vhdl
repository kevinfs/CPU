LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_mux_10_utest is
end entity generic_mux_10_utest;

architecture generic_mux_10_utest of generic_mux_10_utest is

	-- SIGNALS

	signal I0: std_logic_vector(15 downto 0) := "0000000000000000";
	signal I1: std_logic_vector(15 downto 0) := "1000000000000000";
	signal I2: std_logic_vector(15 downto 0) := "1100000000000000";
	signal I3: std_logic_vector(15 downto 0) := "1110000000000000";
	signal I4: std_logic_vector(15 downto 0) := "1111000000000000";
	signal I5: std_logic_vector(15 downto 0) := "1111100000000000";
	signal I6: std_logic_vector(15 downto 0) := "1111110000000000";
	signal I7: std_logic_vector(15 downto 0) := "1111111000000000";
	signal I8: std_logic_vector(15 downto 0) := "1111111100000000";
	signal I9: std_logic_vector(15 downto 0) := "1111111110000000";
	signal SEL: std_logic_vector(3 downto 0) := "0000";
	signal O: std_logic_vector(15 downto 0) := "0000000000000000";

begin

	-- INSTANCE

	DUT : entity WORK.generic_mux_10 (generic_mux_10) port map (I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, SEL, O);

	-- CASES

	SEL <= "0001" after 1 ns, "0010" after 2 ns, "0011" after 3 ns,
			"0100" after 4 ns, "0101" after 5 ns, "0110" after 6 ns,
			"0111" after 7 ns, "1000" after 8 ns, "1001" after 9 ns,
			"1010" after 10 ns, "1101" after 11 ns;

end architecture generic_mux_10_utest;