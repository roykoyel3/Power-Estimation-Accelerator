`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 23:55:33
// Design Name: 
// Module Name: tff
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


module tff(t,clk,q,qb);
input t,clk;
output reg q,qb;
initial q=0;

always@(posedge clk)begin
case(t)
1'b0:q=q;
1'b1:q=~q;
endcase
end
always@(*)begin
qb=~q;
end
endmodule
