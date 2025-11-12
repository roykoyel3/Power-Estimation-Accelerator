module ring_tb;
     reg init;
     reg clk;
     wire [7:0] count;
     ring_counter DUT(.init(init),.clk(clk),.count(count));
     always #1 clk = ~clk;
     initial
      begin
        $dumpfile("sim_gl/Ring_gl.vcd");
        $dumpvars(0,ring_tb);
        init=1;
        clk=0;
        #5 init=0;
        #10 $finish;
      end
endmodule         
