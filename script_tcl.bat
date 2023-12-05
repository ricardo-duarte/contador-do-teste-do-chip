:: UFMG
:: Prof. Ricardo de Oliveira Duarte - DELT/EE/UFMG
:: Script TCL - versão 1.0
:: This is a simple script to be launched in a MS-Windows command window.
:: Modify the line below to the path on your computer where your source files to be compiled and simulated are located.
cd C:\Users\UFMG\Documents\UFMG\LSD\ERE\LSD2
:: Modify the following lines to include the .vhd files you want to analyze (compile).
ghdl -a SyncCounter.vhd
ghdl -a Testbench_SyncCounter.vhd
:: Modify the following line with the name of the top level entity from the testbench file that you want to simulate.
ghdl -e Testbench_SyncCounter
:: Modify the following line with the name of the testbench file you want to simulate and the name of the .vcd file you want to generate.
ghdl -r Testbench_SyncCounter --vcd=Testbench_SyncCounter.vcd
:: Modify the following line with the name of the .vcd file you want to view with GTKWAVE.
gtkwave -f Testbench_SyncCounter.vcd  --script=gtkwave_print.tcl
:Done
