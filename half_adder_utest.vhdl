LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity half_adder_utest is
	port (
		RESULT, CARRY : out std_logic
	);
end entity half_adder_utest;

architecture half_adder_utest of half_adder_utest is

	signal A: std_logic := '0';
	signal B: std_logic := '0';
	--signal RESULT: std_logic;
	--signal CARRY: std_logic;

begin

	DUT : entity WORK.half_adder (half_adder) port map (A, B, RESULT, CARRY);

	A <= '1' after 2 ns, '0' after 6 ns, '1' after 10 ns;
	B <= '1' after 4 ns, '0' after 8 ns, '1' after 12 ns;



	process(A, B)
	begin
		assert now < 80 ns
			report "END OF SIMULATION"
			severity failure;

		report "The value of 'result' is " & std_logic'image(RESULT);
	end process;




end architecture half_adder_utest;