module dff(D,clk,Q,Q_bar);
      input D,clk;
      output reg Q,Q_bar;
      always @(negedge clk)
            begin
                Q = D;
                Q_bar = ~D;
            end 
endmodule       
