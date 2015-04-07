LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
	port (
		INSTRUCTION : in std_logic_vector(8 downto 0);
		RUN, RESET, CLOCK : in std_logic;
		DONE : out std_logic;
		SEL_ALU : in std_logic_vector(1 downto 0);
		SEL_MUX : in std_logic_vector(3 downto 0);
		W : out std_logic_vector(9 downto 0)
	);
end entity control_unit;

architecture control_unit of control_unit is

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

	component generic_shifter is
		generic(
			SIZE : integer := 16
		);
		port (
			A : in std_logic_vector(SIZE-1 downto 0);
			O : out std_logic_vector(SIZE-1 downto 0)
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

	SH_SHI : generic_shifter generic map(SIZE) port map(A, SHI);

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

end architecture control_unit;