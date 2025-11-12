`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 23:41:24
// Design Name: 
// Module Name: srff
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

module srff(sr, clk, q, qb);
input [1:0] sr;   // sr is 2-bit input (OK)
input clk;        // clk MUST be 1-bit
output q, qb;
reg q;

always @(posedge clk) begin
    case(sr)
        2'b00: q <= q;    // No change
        2'b01: q <= 1'b0; // Reset
        2'b10: q <= 1'b1; // Set
        2'b11: q <= q;    // Invalid (hold or define as needed)
    endcase
end

assign qb = ~q;

endmodule

