LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_mux_10 is
	generic(
		SIZE : integer := 16
	);
	port (
		I0, I1, I2, I3, I4, I5, I6, I7, I8, I9 : in std_logic_vector(SIZE-1 downto 0);
		SEL : in std_logic_vector(3 downto 0);
		O : out std_logic_vector(SIZE-1 downto 0)
	);
end entity generic_mux_10;

architecture generic_mux_10 of generic_mux_10 is

begin

	-- PROCESS

	process(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, SEL)
	begin

		-- use case statement
		case SEL is
			when "0000" =>	O <= I0;
			when "0001" =>	O <= I1;
			when "0010" =>	O <= I2;
			when "0011" =>	O <= I3;
			when "0100" =>	O <= I4;
			when "0101" =>	O <= I5;
			when "0110" =>	O <= I6;
			when "0111" =>	O <= I7;
			when "1000" =>	O <= I8;
			when "1001" =>	O <= I9;
			when others =>	O <= "ZZZZZZZZZZZZZZZZ";
		end case;

	end process;

end architecture generic_mux_10;