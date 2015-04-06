LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
	port (
		A, B, CARRY_IN : in std_logic;
		SUM, CARRY_OUT : out std_logic
	);
end entity full_adder;

architecture full_adder of full_adder is

	-- IMPORTS

	component half_adder is
		port (
			A, B : in std_logic;
			SUM, CARRY : out std_logic
		);
	end component;

	-- SIGNALS

	signal HA1_CARRY_OUT: std_logic;
	signal HA2_SUM: std_logic;
	signal HA2_CARRY_OUT: std_logic;

begin

	-- ROUTING

	HA1 : half_adder port map(CARRY_IN, HA2_SUM, SUM, HA1_CARRY_OUT);
	HA2 : half_adder port map(A, B, HA2_SUM, HA2_CARRY_OUT);

	-- PROCESS

	process(A, B, CARRY_IN)
	begin
		CARRY_OUT <= HA1_CARRY_OUT OR HA2_CARRY_OUT;
	end process;

end architecture full_adder;