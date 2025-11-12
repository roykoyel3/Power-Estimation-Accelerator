`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 23:04:06
// Design Name: 
// Module Name: half_adder_tb
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


module half_adder_tb();
reg t_a, t_b;
wire SUM, CARRY;

half_adder dut(.a(t_a), .b(t_b), .sum(SUM), .carry(CARRY));

initial begin
    $dumpfile("vcd/half_adder_gl.vcd");
    $dumpvars(0, half_adder_tb);
end


initial begin
$monitor("a=%b b=%b sum=%b carry=%b",t_a,t_b,SUM,CARRY);
end

initial begin
t_a=0;
t_b=0;
#10
t_a=0;
t_b=1;
#10
t_a=1;
t_b=0;
#10
t_a=1;
t_b=1;
#10
$stop;
end
endmodule
