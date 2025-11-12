module dff_tb;
       reg D,clk;
       wire Q,Q_bar;
       dff DUT(D,clk,Q,Q_bar);
       always #7 clk = ~clk;
       initial
        begin
           clk=0;
           D=1;   
           $dumpfile("sim_gl/dff_gl_2.vcd");
           $dumpvars(0,dff_tb);
           $monitor($time,"D=%b,Q=%b,Q_bar=%b",D,Q,Q_bar);
           #2 D=0;
           #12 D=5;
           #20 $finish;
       end
endmodule
