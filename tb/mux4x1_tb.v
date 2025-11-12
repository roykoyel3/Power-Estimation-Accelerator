`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 11:29:44
// Design Name: 
// Module Name: mux4x1_tb
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


module mux4x1_tb();
reg a,b,c,d;
reg[1:0] sel;
wire out;

mux4x1 dut(.a(a),.b(b),.c(c),.d(d),.sel(sel),.out(out));

initial begin
$dumpfile("vcd/mux4x1_gl.vcd");
$dumpvars(0, mux4x1_tb);
end

initial begin
sel=2'b00;a=1;b=0;c=1;d=1;
#5
sel=2'b01;a=1;b=1;c=0;d=1;
#5
sel=2'b00;a=0;b=0;c=1;d=1;
#5
sel=2'b10;a=1;b=1;c=1;d=1;
#5
sel=2'b11;a=1;b=0;c=0;d=0;
#6
sel=2'b10;a=1;b=0;c=0;d=1;
#9
sel=2'b01;a=0;b=0;c=1;d=0;
#10
$finish();
end
endmodule
