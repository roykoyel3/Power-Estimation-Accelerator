`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 23:18:16
// Design Name: 
// Module Name: decoder2x4_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder2x4_tb3();
reg[1:0]in;
wire[3:0]out;

decoder2x4 dut(.in(in),.out(out));

initial begin
$dumpfile("vcd/decoder2x4_gl3.vcd");
$dumpvars(0, decoder2x4_tb3);
end
initial begin
in=2'b00;
#5
in=2'b01;
#5
in=2'b10;
#10
in=2'b11;
#7
in=2'b11;
#8
in=2'b01;
#5
in=2'b00;
#12
$finish();
end
endmodule
