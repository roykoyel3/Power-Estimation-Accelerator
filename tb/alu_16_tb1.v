module ALU_tb;
     reg[15:0] X,Y;
     wire[15:0] Z;
     wire S,Cr,Ze,P,O;
     ALU DUT(X,Y,Z,S,Cr,Ze,P,O);
     initial
         begin
            $dumpfile("sim_gl/alu_gl_1.vcd");
            $dumpvars(0, ALU_tb);
            $monitor($time,"X=%h,Y=%h,Z=%h,S=%b,Cr=%b,Ze=%b,P=%b,O=%b",X,Y,Z,S,Cr,Ze,P,O);
            #2 X =16'h4F86;Y=16'h1238;
            #7 X =16'h4F85;Y=16'h8000;
            #6 X =16'hAAAA;Y=16'h5557;
            #15 $finish;
         end
endmodule         
