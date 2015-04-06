LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_register is
	generic(
		SIZE : integer := 16
	);
	port (
		I : in std_logic_vector(SIZE-1 downto 0);
		W : in std_logic;
		O : out std_logic_vector(SIZE-1 downto 0)
	);
end entity generic_register;

architecture generic_register of generic_register is

	-- IMPORTS

	component d_latch is
		port (
			I, W : in std_logic;
			O : out std_logic
		);
	end component;

	-- SIGNALS

	signal HA1_CARRY_OUT: std_logic;
	signal HA2_SUM: std_logic;
	signal HA2_CARRY_OUT: std_logic;

begin

	-- ROUTING

	full_adders_generation : for I in 0 to SIZE-1 generate
		full_adders : full_adder port map(A(I), B(I), FA_CARRY_OUT(I), SUM(I), FA_CARRY_OUT(I+1));
	end generate;

	HA1 : d_latch port map(CARRY_IN, HA2_SUM, SUM, HA1_CARRY_OUT);
	HA2 : d_latch port map(A, B, HA2_SUM, HA2_CARRY_OUT);

	-- PROCESS

	process(HA1_CARRY_OUT, HA2_CARRY_OUT)
	begin
		CARRY_OUT <= HA1_CARRY_OUT OR HA2_CARRY_OUT;
	end process;

end architecture generic_register;