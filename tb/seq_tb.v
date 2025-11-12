module seq_tb ;
   reg x,clk,rst;
   wire z;
   seq_detector DUT(x , clk , rst , z);
   always #5 clk = ~ clk ;
   initial 
       begin
        $dumpfile("sim_rtl/seq_detector_rtl.vcd");
        $dumpvars(0,seq_tb);
        clk=1'b0 ; rst = 1'b1;
        #15 rst = 1'b0 ;
        end
    initial 
    begin
       #12 x=0; #10 x=1 ; #10 x=1 ; 
       #10 x=0 ; #10 x=1;
       #2 $finish;
    end    
endmodule    
