LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity cpu is
	port (
		DATA_IN : in std_logic_vector(15 downto 0);
		RUN, RESET, CLOCK : in std_logic;
		DONE : out std_logic;
		DATA_OUT : out std_logic_vector(15 downto 0)
	);
end entity cpu;

architecture cpu of cpu is

	-- IMPORTS

	component generic_alu is
		generic(
			SIZE : integer := 16
		);
		port (
			A, B : in std_logic_vector(SIZE-1 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			O : out std_logic_vector(SIZE-1 downto 0)
		);
	end component;

	component generic_mux_10 is
		generic(
			SIZE : integer := 16
		);
		port (
			I0, I1, I2, I3, I4, I5, I6, I7, I8, I9 : in std_logic_vector(SIZE-1 downto 0);
			SEL : in std_logic_vector(3 downto 0);
			O : out std_logic_vector(SIZE-1 downto 0)
		);
	end component;

	component generic_register is
		generic(
			SIZE : integer := 16
		);
		port (
			I : in std_logic_vector(SIZE-1 downto 0);
			W : in std_logic;
			O : out std_logic_vector(SIZE-1 downto 0)
		);
	end component;

	component control_unit is
		port (
			INSTRUCTION : in std_logic_vector(8 downto 0);
			RUN, RESET, CLOCK : in std_logic;
			DONE : out std_logic;
			SEL_ALU : out std_logic_vector(1 downto 0);
			SEL_MUX : out std_logic_vector(3 downto 0);
			W : out std_logic_vector(9 downto 0);
			FETCH : out std_logic
		);
	end component;

	-- SIGNALS

	signal W: std_logic_vector(9 downto 0);

	signal DATA_OUT_INTERNAL: std_logic_vector(15 downto 0);
	signal DONE_INTERNAL: std_logic := '1';
	signal FETCH: std_logic;

	signal R_TO_MUX_0: std_logic_vector(15 downto 0);
	signal R_TO_MUX_1: std_logic_vector(15 downto 0);
	signal R_TO_MUX_2: std_logic_vector(15 downto 0);
	signal R_TO_MUX_3: std_logic_vector(15 downto 0);
	signal R_TO_MUX_4: std_logic_vector(15 downto 0);
	signal R_TO_MUX_5: std_logic_vector(15 downto 0);
	signal R_TO_MUX_6: std_logic_vector(15 downto 0);
	signal R_TO_MUX_7: std_logic_vector(15 downto 0);

	signal R_TO_ALU: std_logic_vector(15 downto 0);

	signal R_TO_MUX_ACC: std_logic_vector(15 downto 0);

	signal SEL_MUX: std_logic_vector(3 downto 0);
	signal SEL_ALU: std_logic_vector(1 downto 0);
	signal ALU_TO_ACC: std_logic_vector(15 downto 0);

	signal INSTRUCTION: std_logic_vector(8 downto 0);

begin

	-- ROUTING

	-- REGISTERS
	R0 : generic_register port map(DATA_OUT_INTERNAL, W(0), R_TO_MUX_0); -- I, W, O
	R1 : generic_register port map(DATA_OUT_INTERNAL, W(1), R_TO_MUX_1);
	R2 : generic_register port map(DATA_OUT_INTERNAL, W(2), R_TO_MUX_2);
	R3 : generic_register port map(DATA_OUT_INTERNAL, W(3), R_TO_MUX_3);
	R4 : generic_register port map(DATA_OUT_INTERNAL, W(4), R_TO_MUX_4);
	R5 : generic_register port map(DATA_OUT_INTERNAL, W(5), R_TO_MUX_5);
	R6 : generic_register port map(DATA_OUT_INTERNAL, W(6), R_TO_MUX_6);
	R7 : generic_register port map(DATA_OUT_INTERNAL, W(7), R_TO_MUX_7);

	RA : generic_register port map(DATA_OUT_INTERNAL, W(8), R_TO_ALU);

	RACC : generic_register port map(DATA_OUT_INTERNAL, W(9), R_TO_MUX_ACC);

	RI : generic_register generic map(9) port map(DATA_IN(8 downto 0), FETCH, INSTRUCTION);

	-- ALU
	ALU : generic_alu port map(R_TO_ALU, DATA_OUT_INTERNAL, SEL_ALU, ALU_TO_ACC); -- A, B, SEL, O

	-- MUX
	MUX : generic_mux_10 port map(R_TO_MUX_0, R_TO_MUX_1, R_TO_MUX_2, R_TO_MUX_3, R_TO_MUX_4, R_TO_MUX_5, R_TO_MUX_6, R_TO_MUX_7, R_TO_MUX_ACC, DATA_IN, SEL_MUX, DATA_OUT_INTERNAL); -- I0-I9, SEL, O

	-- CONTROL UNIT
	CONTROL : control_unit port map(INSTRUCTION, RUN, RESET, CLOCK, DONE_INTERNAL, SEL_ALU, SEL_MUX, W, FETCH); -- INSTRUCTION, RUN, RESET, CLOCK, DONE, SEL_ALU, SEL_MUX, W

	-- REDIRECTIONS
	DATA_OUT <= DATA_OUT_INTERNAL;
	DONE <= DONE_INTERNAL;

end architecture cpu;