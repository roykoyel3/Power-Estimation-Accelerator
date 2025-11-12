`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 23:13:38
// Design Name: 
// Module Name: decoder2x4
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


module decoder2x4(in,out);
input[1:0] in;
output[3:0]out;
reg [3:0]out;

always@(*)begin
case(in)
2'b00:out=4'b0001;
2'b01:out=4'b0010;
2'b10:out=4'b0100;
2'b11:out=4'b1000;
endcase
end 
endmodule
