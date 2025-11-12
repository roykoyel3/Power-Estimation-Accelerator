`timescale 1ns / 1ps

module traffic_light_controller_tb();
reg clk,rst;
wire [2:0]light_M1;
wire [2:0]light_S;
wire [2:0]light_MT;
wire [2:0]light_M2;
traffic_light_controller dut(.clk(clk) , .rst(rst) , .light_M1(light_M1) , .light_S(light_S)  ,.light_M2(light_M2),.light_MT(light_MT)   );
initial begin
    clk = 0;
    forever #2 clk = ~clk; // 10 ns period (100 MHz)
end

initial begin
    rst = 1; 
    #2;     
    rst = 0;
end

initial begin 
    $dumpfile("sim_gl/traffic_gl_1.vcd");
    $dumpvars(0, traffic_light_controller_tb);
    end
    



endmodule
