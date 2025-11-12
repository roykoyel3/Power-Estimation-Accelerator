`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2025 19:10:49
// Design Name: 
// Module Name: evm_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for votingMachine
// 
// Dependencies: votingMachine module
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module evm_tb();

reg clk;
reg reset;
reg mode;
reg button1;
reg button2;
reg button3;
reg button4;
wire [7:0] led;

// Instantiate DUT
votingMachine dut(
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .button1(button1),
    .button2(button2),
    .button3(button3),
    .button4(button4),
    .led(led)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz clock
end

// Stimulus
initial begin
    reset = 1; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #100;
    reset = 0;

    // Sequence of button presses and mode changes
    #5 button1 = 1; #10 button1 = 0;
    #5 button1 = 1; #200 button1 = 0;

    #5 button2 = 1; #200 button2 = 0;

    #5 button2 = 1; button3 = 1; #200 button2 = 0; button3 = 0;

    #5 mode = 1; button2 = 1; #200 mode = 1; button2 = 0; button3 = 1; #5 reset = 0; mode = 0; button3 = 0;

    #5 button3 = 1; #200 button3 = 0;

    #5 button3 = 1; button4 = 1; #200 button3 = 0; button4 = 0;

    #5 button4 = 1; #200 mode = 1; button4 = 1; #5 button4 = 1; #10 button4 = 0;

    #5000;
    $finish;
end

// VCD dump
initial begin
    $dumpfile("sim_gl/evm_gl_2.vcd"); // Change path if needed
    $dumpvars(1, dut);
end

// Monitor signals
initial begin
    $monitor($time, " | mode=%b, button1=%b, button2=%b, button3=%b, button4=%b, led=%d",
        mode, button1, button2, button3, button4, led);
end

endmodule

