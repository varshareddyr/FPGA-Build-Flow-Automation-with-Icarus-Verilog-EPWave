#!/bin/bash
iverilog -g2012 -o counter_tb design.sv testbench.sv
vvp counter_tb
gtkwave dump.vcd &
