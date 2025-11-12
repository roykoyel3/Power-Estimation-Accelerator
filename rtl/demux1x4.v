`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 15:31:24
// Design Name: 
// Module Name: demux1x4
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


module demux1x4(a, sel, o0, o1, o2, o3);
input [3:0] a;
input [1:0] sel;
output reg o0, o1, o2, o3;

always @(*) begin
    // default assignments → prevents latch
    o0 = 0;
    o1 = 0;
    o2 = 0;
    o3 = 0;

    case(sel)
        2'b00: o0 = a[0];
        2'b01: o1 = a[1];
        2'b10: o2 = a[2];
        2'b11: o3 = a[3];
    endcase
end

endmodule

