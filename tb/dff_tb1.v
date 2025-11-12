module dff_tb;
       reg D,clk;
       wire Q,Q_bar;
       dff DUT(D,clk,Q,Q_bar);
       always #2 clk = ~clk;
       initial
        begin
           clk=0;
           D=0;   
           $dumpfile("sim_gl/dff_gl_1.vcd");
           $dumpvars(0,dff_tb);
           $monitor($time,"D=%b,Q=%b,Q_bar=%b",D,Q,Q_bar);
           #2 D=1;
           #10 D=0;
           #20 $finish;
       end
endmodule
