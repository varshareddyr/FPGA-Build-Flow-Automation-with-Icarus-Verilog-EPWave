`timescale 1ns/1ps
module tb_counter;

    logic clk;
    logic reset;
    logic [3:0] count;

    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_counter);

        $display("time(ns)  reset  count");
        $monitor("%d   %b   %d", $time, reset, count);

        clk = 0;
        reset = 1; #12;
        reset = 0;

        #100;
        $finish;
    end
endmodule
