`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 01:46:41
// Design Name: 
// Module Name: mux2x1_tb
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


module mux2x1_tb();
reg a,b,sel;
wire out;

mux2x1 dut(.a(a),.b(b),.sel(sel),.out(out));
initial begin
$dumpfile("vcd/mux2x1_gl.vcd");
$dumpvars(0, mux2x1_tb);
end
initial begin
a=0;b=1;sel=0;
#5
a=1;b=0;sel=1;
#8
a=1;b=0;sel=0;
#5
a=1;b=1;sel=1;
#5
a=0;b=1;sel=1;
#4
a=1;b=0;sel=0;
#7
$finish();
end 
endmodule
