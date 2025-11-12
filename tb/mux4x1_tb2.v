`timescale 1ns / 1ps

module mux4x1_tb2();
    reg a, b, c, d;
    reg [1:0] sel;
    wire out;

    // DUT
    mux4x1 dut(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    // VCD Dump
    initial begin
        $dumpfile("vcd/mux4x1_rtl2.vcd");
        $dumpvars(0, mux4x1_tb2);
    end

    // Stimulus
    initial begin
        sel = 2'b00; a=1; b=0; c=1; d=1; #5;
        sel = 2'b01; a=1; b=1; c=0; d=1; #6;
        sel = 2'b00; a=0; b=0; c=1; d=1; #9;
        sel = 2'b10; a=1; b=1; c=1; d=1; #2;
        sel = 2'b11; a=1; b=0; c=0; d=0; #10;
        sel = 2'b10; a=1; b=0; c=0; d=1; #5;
        sel = 2'b01; a=0; b=0; c=1; d=0; #8;
        sel = 2'b11; a=0; b=0; c=0; d=0; #10;
        $finish;
    end

endmodule

