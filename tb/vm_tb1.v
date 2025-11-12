`timescale 1ns / 1ps


module vm_tb();
    reg clk;
    reg [1:0]in;
    reg reset;
    wire out;
    wire [1:0]change;
    
    vm dut(.clk(clk), .reset(reset), .in(in), .out(out), .change(change));
    
    initial begin 
    $dumpfile("sim_gl/vm_gl_1.vcd");
    $dumpvars(0, vm_tb);
    end
    
    initial begin 
    reset =1;
    clk = 0;
    
    #16 reset = 0;
    in = 2'b01;
    #10 in = 2'b01;
    #12 in = 2'b10;
    #25 $finish;
    end
     always #5 clk =~clk;
    
    
endmodule
