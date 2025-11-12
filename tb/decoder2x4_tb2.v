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


module decoder2x4_tb2();
reg[1:0]in;
wire[3:0]out;

decoder2x4 dut(.in(in),.out(out));

initial begin
$dumpfile("vcd/decoder2x4_gl2.vcd");
$dumpvars(0, decoder2x4_tb2);
end
initial begin
in=2'b00;
#5
in=2'b01;
#3
in=2'b10;
#5
in=2'b11;
#5
in=2'b10;
#3
in=2'b00;
#8
in=2'b01;
#10
$finish();
end
endmodule
