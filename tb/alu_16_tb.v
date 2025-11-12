module ALU_tb;
     reg[15:0] X,Y;
     wire[15:0] Z;
     wire S,Cr,Ze,P,O;
     ALU DUT(X,Y,Z,S,Cr,Ze,P,O);
     initial
         begin
            $dumpfile("sim_gl/alu_gl.vcd");
            $dumpvars(0, ALU_tb);
            $monitor($time,"X=%h,Y=%h,Z=%h,S=%b,Cr=%b,Ze=%b,P=%b,O=%b",X,Y,Z,S,Cr,Ze,P,O);
            #5 X =16'h4F86;Y=16'h1234;
            #5 X =16'h4F87;Y=16'h8000;
            #5 X =16'hAAAA;Y=16'h5555;
            #5 $finish;
         end
endmodule         
