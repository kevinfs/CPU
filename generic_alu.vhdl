LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity generic_alu is
	generic(
		SIZE : integer := 16
	);
	port (
		A, B : in std_logic_vector(SIZE-1 downto 0);
		SEL : in std_logic_vector(1 downto 0);
		O : out std_logic_vector(SIZE-1 downto 0)
	);
end entity generic_alu;

architecture generic_alu of generic_alu is

-- IMPORTS

	component full_adder is
		port (
			A, B, CARRY_IN : in std_logic;
			SUM, CARRY_OUT : out std_logic
		);
	end component;

-- SIGNALS

	signal ADD: std_logic_vector(SIZE-1 downto 0);
	signal ADD: std_logic_vector(SIZE-1 downto 0);

begin

	-- PROCESS

	process(A, B, SEL)
	begin

		-- use case statement
		case SEL is
			when "00" =>	O <= I0;
			when "01" =>	O <= I1;
			when "10" =>	O <= I2;
			when "11" =>	O <= I3;
			when others =>	O <= "ZZZZZZZZZZZZZZZZ";
		end case;

	end process;

end architecture generic_alu;