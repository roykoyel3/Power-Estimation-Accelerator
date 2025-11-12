// -----------------------------------------------------------
// Gate-Level Testbench for MIPS Processor
// For MIPS_32(clk1, clk2) — 2-port netlist
// -----------------------------------------------------------

module MIPS_tb;
    reg clk1, clk2;
    integer cycle_count;

    // Instantiate the gate-level DUT (2 ports only)
    MIPS_32 DUT (clk1, clk2);

    // -------------------------------------------------------
    // Clock generation
    // -------------------------------------------------------
    initial begin
        clk1 = 0; clk2 = 0;
        repeat (200) begin
            #8 clk1 = 1; #8 clk1 = 0;
            #8 clk2 = 1; #8 clk2 = 0;
        end
    end

    // -------------------------------------------------------
    // Simulation monitor and dump
    // -------------------------------------------------------
    initial begin
        cycle_count = 0;
        $dumpfile("sim_gl/MIPS_gl_2.vcd");
        $dumpvars(0, MIPS_tb);

        $display("Starting Gate-Level Simulation (no HALTED signal)...");
        $display("------------------------------------------------");

        #1000;  // run for 1000 time units
        $display("Simulation finished at time %t", $time);
        $display("------------------------------------------------");

        $finish;
    end
endmodule

