`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2025 17:20:14
// Design Name: 
// Module Name: evm
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

module buttonControl(
    input clk,
    input reset,
    input button,
    output reg valid_vote
);

reg [30:0] counter;

always @(posedge clk) begin
    if (reset)
        counter <= 0;
    else begin
        if (button & counter < 11)
            counter <= counter + 1; // button pressed, increment counter
        else if (!button)
            counter <= 0;
    end
end

always @(posedge clk) begin
    if (reset)
        valid_vote <= 1'b0;
    else begin
        if (counter == 10)
            valid_vote <= 1'b1; // valid after 10 clock cycles
        else
            valid_vote <= 1'b0;
    end
end
endmodule


module modeControl(
    input clk,
    input reset,
    input mode,
    input valid_vote_casted,
    input [7:0] cand1_vote,
    input [7:0] cand2_vote,
    input [7:0] cand3_vote,
    input [7:0] cand4_vote,
    input cand1_button_press,
    input cand2_button_press,
    input cand3_button_press,
    input cand4_button_press,
    output reg [7:0] leds
);

reg [30:0] counter;

always @(posedge clk) begin
    if (reset)
        counter <= 0;
    else if (valid_vote_casted)
        counter <= counter + 1;
    else if (counter != 0 & counter < 10)
        counter <= counter + 1;
    else
        counter <= 0;   
end

always @(posedge clk) begin
    if (reset)
        leds <= 0;
    else begin
        if (mode == 0 & counter > 0)
            leds <= 8'hFF;
        else if (mode == 0)
            leds <= 8'h00;
        else if (mode == 1) begin
            if (cand1_button_press)
                leds <= cand1_vote;
            else if (cand2_button_press)
                leds <= cand2_vote;
            else if (cand3_button_press)
                leds <= cand3_vote;
            else if (cand4_button_press)
                leds <= cand4_vote;
        end
    end
end       
endmodule


module voteLogger(
    input clk,
    input reset,
    input mode,
    input cand1_vote_valid,
    input cand2_vote_valid,
    input cand3_vote_valid,
    input cand4_vote_valid,
    output reg [7:0] cand1_vote_recvd,
    output reg [7:0] cand2_vote_recvd,
    output reg [7:0] cand3_vote_recvd,
    output reg [7:0] cand4_vote_recvd
);

always @(posedge clk) begin
    if (reset) begin
        cand1_vote_recvd <= 0;
        cand2_vote_recvd <= 0;
        cand3_vote_recvd <= 0;
        cand4_vote_recvd <= 0;
    end else begin
        if (cand1_vote_valid & mode == 0)
            cand1_vote_recvd <= cand1_vote_recvd + 1;
        else if (cand2_vote_valid & mode == 0)
            cand2_vote_recvd <= cand2_vote_recvd + 1; 
        else if (cand3_vote_valid & mode == 0)
            cand3_vote_recvd <= cand3_vote_recvd + 1; 
        else if (cand4_vote_valid & mode == 0)
            cand4_vote_recvd <= cand4_vote_recvd + 1;   
    end
end        
endmodule


module votingMachine(
    input clk,
    input reset,
    input mode,
    input button1,
    input button2,
    input button3,
    input button4,
    output [7:0] led
);

wire valid_vote_1;
wire valid_vote_2;
wire valid_vote_3;
wire valid_vote_4;
wire [7:0] cand1_vote_recvd;
wire [7:0] cand2_vote_recvd;
wire [7:0] cand3_vote_recvd;
wire [7:0] cand4_vote_recvd;
wire anyValidVote;

assign anyValidVote = valid_vote_1 | valid_vote_2 | valid_vote_3 | valid_vote_4;

buttonControl bc1(
    .clk(clk),
    .reset(reset),
    .button(button1),
    .valid_vote(valid_vote_1)
);

buttonControl bc2(
    .clk(clk),
    .reset(reset),
    .button(button2),
    .valid_vote(valid_vote_2)
);

buttonControl bc3(
    .clk(clk),
    .reset(reset),
    .button(button3),
    .valid_vote(valid_vote_3)
);

buttonControl bc4(
    .clk(clk),
    .reset(reset),
    .button(button4),
    .valid_vote(valid_vote_4)
);

voteLogger VL(
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .cand1_vote_valid(valid_vote_1),
    .cand2_vote_valid(valid_vote_2),
    .cand3_vote_valid(valid_vote_3),
    .cand4_vote_valid(valid_vote_4),
    .cand1_vote_recvd(cand1_vote_recvd),
    .cand2_vote_recvd(cand2_vote_recvd),
    .cand3_vote_recvd(cand3_vote_recvd),
    .cand4_vote_recvd(cand4_vote_recvd)
);

modeControl MC(
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .valid_vote_casted(anyValidVote),
    .cand1_vote(cand1_vote_recvd),
    .cand2_vote(cand2_vote_recvd),
    .cand3_vote(cand3_vote_recvd),
    .cand4_vote(cand4_vote_recvd),
    .cand1_button_press(valid_vote_1),
    .cand2_button_press(valid_vote_2),
    .cand3_button_press(valid_vote_3),
    .cand4_button_press(valid_vote_4),
    .leds(led)
);

endmodule

