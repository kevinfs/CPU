# CPU
A 16 bit processor in VHDL written during a university course

## Compile

``make``

## Run the CPU simulation

``make run``

Output VCD file will be at ``vcd/cpu_utest.vcd``
You can analyse it with ``gtkwave`` by doing ``gtkwave vcd/cpu_utest.vcd``

## Run the complete test suite

``make test``

Output VCD files will be inside ``vcd/``
You can analyse those with ``gtkwave`` by doing ``gtkwave vcd/generic_alu_utest.vcd`` for example
