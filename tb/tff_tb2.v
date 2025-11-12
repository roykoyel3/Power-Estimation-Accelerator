`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 23:59:53
// Design Name: 
// Module Name: tff_tb
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


module tff_tb2();
reg t,clk;
wire q,qb;

tff dut(.t(t),.clk(clk),.q(q),.qb(qb));

initial begin
clk=0;
forever #1 clk=~clk;
end

initial begin
$dumpfile("vcd/tff_gl2.vcd");
$dumpvars(0, tff_tb2);
end

initial begin
t=1;
#5
t=1;
#6
t=0;
#5
t=0;
#7
t=1;
#8
t=1;
#5
t=0;
#9
$finish();
end
endmodule
