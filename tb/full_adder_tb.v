`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 00:27:00
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb();
reg a,b,c;
wire sum, carry;

full_adder dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));

initial begin
$dumpfile("vcd/full_adder_rtl.vcd");
$dumpvars(0,full_adder_tb);
end
initial begin
a=0;b=1;c=0;
#5
a=0;b=1;c=1;
#5
a=0;b=1;c=0;
#5
a=1;b=1;c=1;
#5
a=0;b=0;c=0;
#5
$finish();
end

endmodule
