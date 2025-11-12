module dff_tb;
       reg D,clk;
       wire Q,Q_bar;
       dff DUT(D,clk,Q,Q_bar);
       always #5 clk = ~clk;
       initial
        begin
           clk=0;
           D=0;   
           $dumpfile("sim_gl/dff_gl.vcd");
           $dumpvars(0,dff_tb);
           $monitor($time,"D=%b,Q=%b,Q_bar=%b",D,Q,Q_bar);
           #2 D=1;
           #12 D=0;
           #20 $finish;
       end
endmodule
