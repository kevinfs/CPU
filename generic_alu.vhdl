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

	component generic_full_adder is
		generic(
			SIZE : integer := 16
		);
		port (
			A, B : in std_logic_vector(SIZE-1 downto 0);
			CARRY_IN : in std_logic;
			SUM : out std_logic_vector(SIZE-1 downto 0);
			CARRY_OUT : out std_logic := '0'
		);
	end component;

	-- SIGNALS

	signal ADD: std_logic_vector(SIZE-1 downto 0);
	signal SUB: std_logic_vector(SIZE-1 downto 0);
	signal MUL: std_logic_vector(SIZE-1 downto 0);
	signal SHI: std_logic_vector(SIZE-1 downto 0);
	signal OVERFLOW: std_logic := '0';
	signal UNDERFLOW: std_logic := '0';
	signal UNDERFLOW_TMP: std_logic := '0';
	signal NOT_B: std_logic_vector(SIZE-1 downto 0);
	signal CPM_B: std_logic_vector(SIZE-1 downto 0);
	signal ONE: std_logic_vector(SIZE-1 downto 0);

begin

	-- ROUTING

	NOT_B <= (not B);
	ONE(SIZE-1 downto 1) <= (others => '0');
	ONE(0) <= '1';
	UNDERFLOW <= (not UNDERFLOW_TMP);

	FA_ADD : generic_full_adder generic map(SIZE) port map(A, B, '0', ADD, OVERFLOW);
	FA_SUB : generic_full_adder generic map(SIZE) port map(A, CPM_B, '0', SUB, UNDERFLOW_TMP);
	FA_CPM : generic_full_adder generic map(SIZE) port map(ONE, NOT_B, '0', CPM_B);

	-- PROCESS

	process(ADD, SUB, MUL, SHI, SEL)
	begin

		-- CASE ON SEL
		case SEL is
			when "00" =>	O <= ADD;
			when "01" =>	O <= SUB;
			when "10" =>	O <= MUL;
			when "11" =>	O <= SHI;
			when others =>	O <= (others => 'Z');
		end case;

	end process;

end architecture generic_alu;