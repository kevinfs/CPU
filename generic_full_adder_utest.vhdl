LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_full_adder_utest is
end entity generic_full_adder_utest;

architecture generic_full_adder_utest of generic_full_adder_utest is

	signal A: std_logic_vector(15 downto 0);
	signal B: std_logic_vector(15 downto 0);
	signal RESULT: std_logic_vector(15 downto 0);
	signal CARRY_IN: std_logic := '0';
	signal CARRY_OUT: std_logic := '0';

begin

	-- INSTANCE

	DUT : entity WORK.generic_full_adder (generic_full_adder) port map (A, B, CARRY_IN, RESULT, CARRY_OUT);

	-- CASES

	A <= "0000000000000000" after 1 ns, "0001000000000000" after 2 ns, "0000000000010100" after 6 ns, "1111111111111111" after 10 ns;
	B <= "0000000000000000" after 1 ns, "0001000000000000" after 4 ns, "0000000000001000" after 8 ns, "0000000000000001" after 12 ns;
	CARRY_IN <= '1' after 3 ns, '0' after 4 ns, '0' after 5 ns;

	-- PROCESS

	--process(A, B, CARRY_IN)
	--begin
	--	assert now < 80 ns
	--		report "END OF SIMULATION"
	--		severity failure;

	--	report "The value of 'result' is " & std_logic'image(RESULT);
	--end process;

end architecture generic_full_adder_utest;