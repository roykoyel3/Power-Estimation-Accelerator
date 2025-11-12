`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 17:00:46
// Design Name: 
// Module Name: encoder4x2_tb
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


module encoder4x2_tb2();
reg [3:0]d;
wire [1:0]out;

encoder4x2 dut(.d(d),.out(out));

initial begin
$dumpfile("vcd/encoder4x2_gl2.vcd");
$dumpvars(0, encoder4x2_tb2);
end
initial begin
d=4'b0000;
#5
d=4'b0001;
#10
d=4'b0010;
#5
d=4'b0100;
#5
d=4'b1000;
#12
d=4'b0010;
#15
d=4'b1000;
#5
d=4'b0010;
#10
d=4'b0010;
#5
$finish();
end
endmodule
