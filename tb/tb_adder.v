`timescale 1ns/1ps
module tb_adder;

reg [3:0] a, b;
wire [4:0] sum;

adder dut(a, b, sum);

initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, tb_adder);

    a = 4'd0; b = 4'd0;
    #10 a = 4'd3; b = 4'd5;
    #10 a = 4'd8; b = 4'd7;
    #10 a = 4'd4; b = 4'd9;
    #20 $finish;
end

endmodule

