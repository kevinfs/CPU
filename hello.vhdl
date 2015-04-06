--  Hello world program.
     use std.textio.all; --  Imports the standard textio package.
     LIBRARY IEEE;
     USE IEEE.STD_LOGIC_1164.ALL;
     
     --  Defines a design entity, without any ports.
     entity hello_world is
     end hello_world;
     
     architecture behaviour of hello_world is

     component half_adder is
     	port (
   			A, B : in std_logic;
    		SUM, CARRY : out std_logic
    	);
     end component;

     signal RESULT: std_logic;
     signal CARRY: std_logic;
     --variable a: std_logic;

     begin

      blabla : half_adder port map('1', '1', RESULT, CARRY);
        process(RESULT)
           variable l : line;
        begin
        	if RESULT='1' then 
        		write (l, String'("Hello world!"));
           		writeline (output, l);
        	end if ;
				--write (l, String'("End"));
           		--writeline (output, l);
				report "The value of 'result' is " & std_logic'image(RESULT);
           --wait;
        end process;
     end behaviour;