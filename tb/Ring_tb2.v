module ring_tb;
     reg init;
     reg clk;
     wire [7:0] count;
     ring_counter DUT(.init(init),.clk(clk),.count(count));
     always #1 clk = ~clk;
     initial
      begin
        $dumpfile("sim_gl/Ring_gl_2.vcd");
        $dumpvars(0,ring_tb);
        init=1;
        clk=0;
        #7 init=0;
        #15 $finish;
      end
endmodule         
