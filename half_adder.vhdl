LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
	port (
		A, B : in std_logic;
		SUM, CARRY : out std_logic := '0'
	);
end entity half_adder;

architecture half_adder of half_adder is

begin
	process(A, B)
	begin
		SUM <= A XOR B;
		CARRY <= A AND B;
	end process;
end architecture half_adder;