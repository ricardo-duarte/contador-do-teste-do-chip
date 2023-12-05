This folder contains the following files:

SysCounter.vhd is a 4-bit synchronous counter, with synchronous reset, synchronous parallel load, load signal control, and start_count signal control.

Testbench_SyncCounter.vhd is a simple testbench to a 4-bit synchronous counter, with synchronous reset, synchronous parallel load, load signal control
and start_count signal control.

Testbench_SyncCounter.vcd is the value change dump file obtained by ghdl after simulation of SysCounter with Testbench_SyncCounter, using the "ghdl -r Testbench_SyncCounter --vcd=Testbench_SyncCounter.vcd" command.

script_tcl.bat is a simple script to be launched in a MS-Windows command window. This script launches ghdl and gtkwave to compile vhdl source files, simulate and visualize in a waveform the results of the simulation.

parser.c is a very simple general parser in C language to convert textual input stimulus to gtkwave vcd format.

output.vcd is the output file produced by the executed version of parser.c

DE10_Lite_SyncCounter_pin_assignements.xlsx is the template file to accomplish pin assignement to the DUT SysCounter that will be mapped in the DE10 kit FPGA. 