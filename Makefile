all: half_adder half_adder_utest full_adder full_adder_utest generic_full_adder generic_full_adder_utest d_latch d_latch_utest hello_world

# RUN THE SIMULATION

run:
	ghdl -r hello_world --vcd=vcd.vcd

# RUN ALL TESTS

test: all
	ghdl -r half_adder_utest --vcd=vcd/half_adder_utest.vcd
	ghdl -r full_adder_utest --vcd=vcd/full_adder_utest.vcd
	ghdl -r generic_full_adder_utest --vcd=vcd/generic_full_adder_utest.vcd
	ghdl -r d_latch_utest --vcd=vcd/d_latch_utest.vcd

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

# GENERIC FULL ADDER

generic_full_adder: generic_full_adder.vhdl
	ghdl -a generic_full_adder.vhdl
	ghdl -e generic_full_adder

generic_full_adder_utest: generic_full_adder_utest.vhdl
	ghdl -a generic_full_adder_utest.vhdl
	ghdl -e generic_full_adder_utest

# D LATCH

d_latch: d_latch.vhdl
	ghdl -a d_latch.vhdl
	ghdl -e d_latch

d_latch_utest: d_latch_utest.vhdl
	ghdl -a d_latch_utest.vhdl
	ghdl -e d_latch_utest

# WORKON

hello_world: hello.vhdl
	ghdl -a hello.vhdl
	ghdl -e hello_world

# CLEAN

clean:
	ghdl --clean
	rm work-obj93.cf