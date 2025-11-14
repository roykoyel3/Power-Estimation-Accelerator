module seq_tb ;
   reg x,clk,rst;
   wire z;
   seq_detector DUT(x , clk , rst , z);
   always #5 clk = ~ clk ;
   initial 
       begin
        $dumpfile("sim_gl/seq_detector_gl_1.vcd");
        $dumpvars(0,seq_tb);
        clk=1'b0 ; rst = 1'b1;
        #10 rst = 1'b0 ;
        end
    initial 
    begin
       #12 x=0; #10 x=1 ; #10 x=1 ; 
       #5 x=0 ; #10 x=1;
       #20 $finish;
    end    
endmodule    
