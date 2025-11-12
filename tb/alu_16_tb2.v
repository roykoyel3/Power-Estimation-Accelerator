module ALU_tb;
     reg[15:0] X,Y;
     wire[15:0] Z;
     wire S,Cr,Ze,P,O;
     ALU DUT(X,Y,Z,S,Cr,Ze,P,O);
     initial
         begin
            $dumpfile("sim_gl/alu_gl_2.vcd");
            $dumpvars(0, ALU_tb);
            $monitor($time,"X=%h,Y=%h,Z=%h,S=%b,Cr=%b,Ze=%b,P=%b,O=%b",X,Y,Z,S,Cr,Ze,P,O);
            #0 X =16'h4F80;Y=16'h1234;
            #15 X =16'h4E87;Y=16'h8000;
            #3 X =16'hAA2A;Y=16'h5555;
            #7 $finish;
         end
endmodule         
