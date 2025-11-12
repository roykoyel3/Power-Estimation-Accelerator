`timescale 1ns / 1ps

module vm(
    input clk,
    input reset,
    input [1:0] in,
    output reg out,
    output reg [1:0] change
);

    // States
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;

    reg [1:0] c_state, n_state;

    // Sequential state update
    always @(posedge clk or posedge reset) begin
        if (reset) 
            c_state <= s0;
        else 
            c_state <= n_state;
    end

    // Combinational next-state and output logic
    always @(*) begin
        // default values
        n_state = c_state;
        out     = 0;
        change  = 2'b00;

        case (c_state)
            s0: begin
                if (in == 2'b00) begin
                    n_state = s0;
                    out = 0;
                    change = 2'b00;
                end
                else if (in == 2'b01) begin
                    n_state = s1;
                    out = 0;
                    change = 2'b00;
                end
                else if(in == 2'b10) begin
                    n_state = s2;
                    out = 0;
                    change = 2'b00;
                end
            end

            s1: begin
                if (in == 2'b00) begin
                    n_state = s0;
                    out = 0;
                    change  = 2'b01;
                end else if (in == 2'b01) begin
                    n_state = s2;
                    out = 0;
                    change = 2'b00;
                end else if (in == 2'b10) begin
                    n_state = s0;
                    out = 1;
                    change = 2'b00;
                end
            end

            s2: begin
                if (in == 2'b00) begin
                    n_state = s0;
                    out = 0;
                    change = 2'b00;
                end else if (in == 2'b01) begin
                    n_state = s0;
                    out     = 1;
                    change = 2'b00;
                end else if (in == 2'b10) begin
                    n_state = s0;
                    out     = 1;
                    change  = 2'b01;
                end
            end
        endcase
    end
endmodule
