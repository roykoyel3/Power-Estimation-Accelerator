`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 00:19:50
// Design Name: 
// Module Name: full_adder
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


module full_adder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3;

half_adder ha1(.a(a),.b(b),.sum(w1),.carry(w2));
half_adder ha2(.a(w1),.b(c),.sum(sum),.carry(w3));
or u1(carry,w2,w3);

endmodule

module half_adder(a,b,sum,carry);
input a,b;
output sum, carry;

assign sum=a^b;
assign carry=a&b;

endmodule
