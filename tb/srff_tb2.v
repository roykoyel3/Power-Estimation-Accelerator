`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 23:48:52
// Design Name: 
// Module Name: srff_tb
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


module srff_tb2();
reg [1:0]sr; 
reg clk;
wire q,qb;

srff dut(.sr(sr),.clk(clk),.q(q),.qb(qb));

initial begin
clk=0;
forever 
#2 clk=~clk;
end 
initial begin
$dumpfile("vcd/srff_gl2.vcd");
$dumpvars(0, srff_tb2);
end
initial begin
sr=2'b00;
#6
sr=2'b01; 
#5
sr=2'b10; 
#3
sr=2'b11; 
#5
sr=2'b10; 
#10
sr=2'b01; 
#5
sr=2'b10;
#5
sr=2'b11;
#8
sr=2'b01;
#5
$finish();
end 
endmodule
