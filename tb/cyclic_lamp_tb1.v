module cyclic_tb;
     reg clock;
     wire [2:0]light;
     cyclic_lamp DUT(.light(light),.clock(clock));
     always #2 clock = ~clock;
     initial begin
      clock= 1'b0;
      #100 $finish;
     end
     initial
         begin
            $dumpfile("sim_gl/cyclic_lamp_gl_1.vcd");
            $dumpvars(0,cyclic_tb);
            $monitor($time,"RGY=%b",light);
         end
endmodule         
