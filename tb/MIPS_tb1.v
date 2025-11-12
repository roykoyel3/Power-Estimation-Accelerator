module MIPS_tb;
      reg clk1,clk2;
      integer k;

      MIPS_32 DUT(clk1, clk2);

      initial 
      begin
          clk1 = 0; clk2 = 0;
          repeat(20)
             begin
                #6 clk1 = 1 ; #5 clk1 = 0 ;
                #2 clk2 = 1 ; #5 clk2 = 0 ;
             end  
      end

      initial begin
        for (k = 0; k < 31 ; k ++ ) 
             DUT.regfile[k] = k;

        DUT.mem[0] = 32'h2801000a ;   //ADDI R1,R0,10
        DUT.mem[1] = 32'h28020014 ;   //ADDI R2,R0,20
        DUT.mem[2] = 32'h28030019 ;   //ADDI R3,R0,25
        DUT.mem[3] = 32'h0ce73800 ;   //OR R7,R7,R7  //DUMMY INSTRUCTION
        DUT.mem[4] = 32'h0ce00000 ;   //OR R7,R7,R7  //DUMMY INSTRUCTION
        DUT.mem[5] = 32'h00222000 ;   //ADD R4,R1,R2
        DUT.mem[6] = 32'h0ce73800 ;   //OR R7,R7,R7  //DUMMY INSTRUCTION
        DUT.mem[7] = 32'h00832800 ;   //ADD R5,R4,R3
        DUT.mem[8] = 32'hfc000000 ;   //HLT

        DUT.HALTED = 0;
        DUT.TAKEN_BRANCH = 0;
        DUT.PC = 0;

        #280 for (k = 0; k<6; k++ )        
                $display ("R%1d - %2d",k,DUT.regfile[k]);
        
      end

      initial begin
        $dumpfile("sim_gl/MIPS_gl_1.vcd");
        $dumpvars(0,MIPS_tb);
        #300 $finish;
      end
endmodule      
