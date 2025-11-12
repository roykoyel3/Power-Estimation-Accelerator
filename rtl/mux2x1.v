`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 01:44:58
// Design Name: 
// Module Name: mux2x1
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


module mux2x1(a,b,sel,out);
input a,b,sel;
output out;

//case statement
reg out;
always @(a or b or sel) begin
case(sel)
1'b0:out=a;
1'b1:out=b;
endcase
end

//behavioral modelling
//reg out;
//always @(a,b,sel)begin
//if(~sel)
//out=a;
//else
//out=b;
//end

//structural modelling
//wire y1,y2,y3;

//not u1(y1,sel);
//and u2(y2,y1,a);
//and u3(y3,sel,b);
//or u4(out,y3,y2);

//data flow modelling
//assign out= (~sel)&a |sel&b;

endmodule
