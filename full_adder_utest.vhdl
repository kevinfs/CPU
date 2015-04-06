LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity full_adder_utest is
end entity full_adder_utest;

architecture full_adder_utest of full_adder_utest is

	signal A: std_logic := '0';
	signal B: std_logic := '0';
	signal RESULT: std_logic := '0';
	signal CARRY_IN: std_logic := '0';
	signal CARRY_OUT: std_logic := '0';

begin

	-- INSTANCE

	DUT : entity WORK.full_adder (full_adder) port map (A, B, CARRY_IN, RESULT, CARRY_OUT);

	-- CASES

	A <= '1' after 2 ns, '0' after 6 ns, '1' after 10 ns;
	B <= '1' after 4 ns, '0' after 8 ns, '1' after 12 ns;
	CARRY_IN <= '1' after 3 ns, '0' after 4 ns, '1' after 5 ns;

	-- PROCESS

	process(A, B)
	begin
		assert now < 80 ns
			report "END OF SIMULATION"
			severity failure;

		report "The value of 'result' is " & std_logic'image(RESULT);
	end process;

end architecture full_adder_utest;