LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_full_adder is
	generic(
		SIZE : integer := 16
	);
	port (
		A, B : in std_logic_vector(SIZE-1 downto 0);
		CARRY_IN : in std_logic;
		SUM : out std_logic_vector(SIZE-1 downto 0);
		CARRY_OUT : out std_logic := '0'
	);
end entity generic_full_adder;

architecture generic_full_adder of generic_full_adder is

	-- IMPORTS

	component full_adder is
		port (
			A, B, CARRY_IN : in std_logic;
			SUM, CARRY_OUT : out std_logic
		);
	end component;

	-- SIGNALS

	signal FA_CARRY_OUT: std_logic_vector(SIZE downto 0);

begin

	-- INIT FIRST CARRY_OUT FROM CARRY_IN

	FA_CARRY_OUT(0) <= CARRY_IN;
	CARRY_OUT <= FA_CARRY_OUT(SIZE);

	-- ROUTING

	full_adders_generation : for I in 0 to SIZE-1 generate
		full_adders : full_adder port map(A(I), B(I), FA_CARRY_OUT(I), SUM(I), FA_CARRY_OUT(I+1));
	end generate;

end architecture generic_full_adder;