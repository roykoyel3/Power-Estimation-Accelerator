`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 11:28:20
// Design Name: 
// Module Name: mux4x1
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


module mux4x1(a,b,c,d,sel,out);
input a,b,c,d;
input[1:0]sel;
output out;

//using 2x1 mux
wire wi,w2;

mux2x1 u1(.a(a),.b(b),.sel(sel[0]),.out(w1));
mux2x1 u2(.a(c),.b(d),.sel(sel[0]),.out(w2));
mux2x1 u3(.a(w1),.b(w2),.sel(sel[1]),.out(out));
endmodule

module mux2x1(a,b,sel,out);
input a,b,sel;
output out;
reg out;
always @(a,b,sel) begin
case(sel)
1'b0:out=a;
1'b1:out=b;
endcase
end
endmodule
//reg out;
// always @(*)begin
// case(sel)
//  2'b00:out=a;
//  2'b01:out=b;
//  2'b10:out=c;
//  2'b11:out=d;
// endcase
// end
