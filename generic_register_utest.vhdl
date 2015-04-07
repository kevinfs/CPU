LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_register_utest is
end entity generic_register_utest;

architecture generic_register_utest of generic_register_utest is

	signal I: std_logic_vector(15 downto 0);
	signal W: std_logic := '0';
	signal O: std_logic_vector(15 downto 0);

begin

	-- INSTANCE

	DUT : entity WORK.generic_register (generic_register) port map (I, W, O);

	-- CASES

	I <= "0000000000000000" after 1 ns, "0001000000000000" after 2 ns, "0001000100010000" after 4 ns, "0000000000010100" after 6 ns, "1111111111111111" after 10 ns;
	W <= '1' after 3 ns, '0' after 4 ns, '1' after 5 ns, '0' after 6 ns, '1' after 7 ns, '0' after 8 ns, '1' after 9 ns;

end architecture generic_register_utest;