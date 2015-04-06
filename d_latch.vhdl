LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity d_latch is
	port (
		I, W : in std_logic;
		O : out std_logic
	);
end entity d_latch;

architecture d_latch of d_latch is

	-- SIGNALS

	signal AND1: std_logic;
	signal AND2: std_logic;
	signal NOR1: std_logic;
	signal NOR2: std_logic;

begin

	-- ROUTING

	AND1 <= I and W;
	AND2 <= (not I) and W;
	NOR1 <= AND1 nor NOR2;
	NOR2 <= NOR1 nor AND2;
	O <= NOR2;

end architecture d_latch;