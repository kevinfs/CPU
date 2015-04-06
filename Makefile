all: hello_world

run:
	ghdl -r hello_world

hello_world: hello.vhdl
	ghdl -a hello.vhdl
	ghdl -e hello_world

clean:
	ghdl --clean
	rm work-obj93.cf