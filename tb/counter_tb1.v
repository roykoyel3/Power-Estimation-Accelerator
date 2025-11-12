module counter_tb;
    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generation
    always #7 clk = ~clk; // Toggle clock every 5ns (100 MHz clock)

    initial begin
        $dumpfile("sim_gl/counter_gl_1.vcd"); // Generate VCD file for GTKWave
        $dumpvars(0, counter_tb);

        clk = 0;
        rst = 1;  
        #10 rst = 0; 

        #100 $finish;
    end
endmodule


