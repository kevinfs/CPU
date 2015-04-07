LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_shifter is
	generic(
		SIZE : integer := 16
	);
	port (
		A : in std_logic_vector(SIZE-1 downto 0);
		O : out std_logic_vector(SIZE-1 downto 0)
	);
end entity generic_shifter;

architecture generic_shifter of generic_shifter is

begin

	-- PROCESS

	process(A)
	begin

		O(SIZE-1 downto 1) <= A(SIZE-2 downto 0);
		O(0) <= '0';

	end process;

end architecture generic_shifter;