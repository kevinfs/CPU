all: half_adder half_adder_utest full_adder full_adder_utest hello_world

# RUN THE SIMULATION

run:
	ghdl -r hello_world --vcd=vcd.vcd

# RUN ALL TESTS

test: all
	ghdl -r half_adder_utest --vcd=vcd/half_adder_utest.vcd
	ghdl -r full_adder_utest --vcd=vcd/full_adder_utest.vcd

# HALF ADDER

half_adder: half_adder.vhdl
	ghdl -a half_adder.vhdl
	ghdl -e half_adder

half_adder_utest: half_adder_utest.vhdl
	ghdl -a half_adder_utest.vhdl
	ghdl -e half_adder_utest

# FULL ADDER

full_adder: full_adder.vhdl
	ghdl -a full_adder.vhdl
	ghdl -e full_adder

full_adder_utest: full_adder_utest.vhdl
	ghdl -a full_adder_utest.vhdl
	ghdl -e full_adder_utest

# WORKON

hello_world: hello.vhdl
	ghdl -a hello.vhdl
	ghdl -e hello_world

# CLEAN

clean:
	ghdl --clean
	rm work-obj93.cf