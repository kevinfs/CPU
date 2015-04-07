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

begin

	-- ROUTING

	d_latches_generation : for N in 0 to SIZE-1 generate
		d_latches : d_latch port map(I(N), W, O(N));
	end generate;

end architecture generic_register;