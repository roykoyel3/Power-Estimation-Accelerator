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


module tff_tb3();
reg t,clk;
wire q,qb;

tff dut(.t(t),.clk(clk),.q(q),.qb(qb));

initial begin
clk=0;
forever #1 clk=~clk;
end

initial begin
$dumpfile("vcd/tff_gl3.vcd");
$dumpvars(0, tff_tb3);
end

initial begin
t=1;
#4
t=1;
#4
t=0;
#8
t=1;
#5
t=0;
#6
t=1;
#5
t=1;
#5
$finish();
end
endmodule
