`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 15:32:28
// Design Name: 
// Module Name: demux1x4_tb
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


module demux1x4_tb3();
reg [3:0]a;
reg [1:0]sel;
wire o0,o1,o2,o3;

demux1x4 dut(.a(a),.sel(sel),.o0(o0),.o1(o1),.o2(o2),.o3(o3));

initial begin
$dumpfile("vcd/demux1x4_gl3.vcd");
$dumpvars(0, demux1x4_tb3);
end
initial begin
sel=2'b10;a=4'b1101;
#6
sel=2'b01;a=4'b0000;
#9
sel=2'b00;a=4'b0100;
#10
sel=2'b11;a=4'b0101;
#5
sel=2'b01;a=4'b1101;
#5
sel=2'b11;a=4'b1111;
#4
sel=2'b10;a=4'b0111;
#5
$finish();
end
endmodule
