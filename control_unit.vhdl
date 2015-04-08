LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
	port (
		INSTRUCTION : in std_logic_vector(8 downto 0);
		RUN, RESET, CLOCK : in std_logic;
		DONE : out std_logic;
		SEL_ALU : out std_logic_vector(1 downto 0);
		SEL_MUX : out std_logic_vector(3 downto 0);
		W : out std_logic_vector(9 downto 0);
		FETCH : out std_logic
	);
end entity control_unit;

architecture control_unit of control_unit is

	-- SIGNALS

	--type STATES is (IDLE, INIT, CHECK, MV, MVI, ADD, SUB, MUL, SHI);
	signal STATE: std_logic_vector(3 downto 0) := "0000";
	constant STATE_IDLE: std_logic_vector(3 downto 0) := "0000";
	constant STATE_CHECK: std_logic_vector(3 downto 0) := "0001";
	constant STATE_MV: std_logic_vector(3 downto 0) := "0010";
	constant STATE_MVI: std_logic_vector(3 downto 0) := "0011";
	constant STATE_ADD: std_logic_vector(3 downto 0) := "0100";
	constant STATE_SUB: std_logic_vector(3 downto 0) := "0101";
	constant STATE_MUL: std_logic_vector(3 downto 0) := "0110";
	constant STATE_SHI: std_logic_vector(3 downto 0) := "0111";
	constant STATE_ADD2: std_logic_vector(3 downto 0) := "1000";
	constant STATE_ADD3: std_logic_vector(3 downto 0) := "1001";


	signal W_RX: std_logic_vector(9 downto 0) := "0000000000";
	signal W_RY: std_logic_vector(9 downto 0) := "0000000000";
	signal W_A: std_logic_vector(9 downto 0) := "0100000000";
	signal W_ACC: std_logic_vector(9 downto 0) := "1000000000";

	signal SEL_DATA_IN: std_logic_vector(3 downto 0) := "1001";
	signal SEL_ACC: std_logic_vector(3 downto 0) := "1000";
	signal SEL_RX: std_logic_vector(3 downto 0);
	signal SEL_RY: std_logic_vector(3 downto 0);

begin

	-- ROUTING

	SEL_ALU <= INSTRUCTION(7 downto 6);
	-- RX WRITE TRANSMISSION
	with INSTRUCTION(5 downto 3) select W_RX(7 downto 0) <=
		"00000001" when "000",
		"00000010" when "001",
		"00000100" when "010",
		"00001000" when "011",
		"00010000" when "100",
		"00100000" when "101",
		"01000000" when "110",
		"10000000" when "111",
		(others => 'Z') when others;
	-- RX READ TRANSMISSION
	with INSTRUCTION(5 downto 3) select SEL_RX <=
		"0000" when "000",
		"0001" when "001",
		"0010" when "010",
		"0011" when "011",
		"0100" when "100",
		"0101" when "101",
		"0110" when "110",
		"0111" when "111",
		(others => 'Z') when others;
	-- RY WRITE TRANSMISSION
	with INSTRUCTION(2 downto 0) select W_RY(7 downto 0) <=
		"00000001" when "000",
		"00000010" when "001",
		"00000100" when "010",
		"00001000" when "011",
		"00010000" when "100",
		"00100000" when "101",
		"01000000" when "110",
		"10000000" when "111",
		(others => 'Z') when others;
	-- RY READ TRANSMISSION
	with INSTRUCTION(5 downto 3) select SEL_RY <=
		"0000" when "000",
		"0001" when "001",
		"0010" when "010",
		"0011" when "011",
		"0100" when "100",
		"0101" when "101",
		"0110" when "110",
		"0111" when "111",
		(others => 'Z') when others;

	-- PROCESS TRANSITION

	TRANSITION : process(RESET, CLOCK)
	begin

		if RESET = '1' then
			STATE <= STATE_IDLE;
		elsif rising_edge(CLOCK) then
			case STATE is
				-- IDLE
				when STATE_IDLE =>
					if RUN = '1' then
						STATE <= STATE_CHECK;
						DONE <= '0';
					end if;
				-- CHECK
				when STATE_CHECK =>
					if INSTRUCTION(8) = '1' then -- MV, MVI
						if INSTRUCTION(6) = '1' then -- MVI
							STATE <= STATE_MVI;
						else -- MV
							STATE <= STATE_MV;
						end if;
					elsif INSTRUCTION(8) = '0' then -- ADD, SUB, MUL, SHI
						if INSTRUCTION(7) = '0' and INSTRUCTION(6) = '0' then -- ADD
							STATE <= STATE_ADD;
						elsif INSTRUCTION(7) = '0' and INSTRUCTION(6) = '1' then -- SUB
							STATE <= STATE_SUB;
						elsif INSTRUCTION(7) = '1' and INSTRUCTION(6) = '1' then -- MUL
							STATE <= STATE_MUL;
						else -- SHI
							STATE <= STATE_SHI;
						end if;
					end if;
				-- MV
				when STATE_MV =>
					SEL_MUX <= SEL_RY;
					W <= W_RX;
					DONE <= '1';
					STATE <= STATE_IDLE;
				-- MVI
				when STATE_MVI =>
					SEL_MUX <= SEL_DATA_IN;
					W <= W_RX;
					DONE <= '1';
					STATE <= STATE_IDLE;
				when STATE_ADD =>
					SEL_MUX <= SEL_RY;
					W <= W_A;
					STATE <= STATE_ADD2;
				when STATE_ADD2 =>
					SEL_MUX <= SEL_RX;
					W <= W_ACC;
					STATE <= STATE_ADD3;
				when STATE_ADD3 =>
					SEL_MUX <= SEL_ACC;
					W <= W_RX;
					DONE <= '1';
					STATE <= STATE_IDLE;
				when STATE_SUB =>
					--TODO
				when STATE_MUL =>
					--TODO
				when STATE_SHI =>
					--TODO
				when others =>
					--TODO
			end case;
		end if; 
	end process;

	GENERATION : process(STATE)
	begin
		if STATE = STATE_IDLE then
			FETCH <= '1';
		else
			FETCH <= '0';
		end if;
	end process;

end architecture control_unit;