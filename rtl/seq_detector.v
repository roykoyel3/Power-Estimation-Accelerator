//Sequence detectoe for "0110"
module seq_detector(x, clk, rst, z);
     input x,clk,rst;
     output reg z;
     parameter s0 = 0,s1 = 1,s2 = 2,s3 = 3 ;
     reg[1:0] PS,NS;
     always @(posedge clk , posedge rst)
       if(rst) PS <= s0;
       else    PS <= NS; 

     always @ (PS,x)
       case (PS)
          s0 : begin
               z = 0;
               NS = x ? s0 : s1;
          end  

          s1 : begin
               z = 0;
               NS = x ? s2 : s1;
          end  

          s2 : begin
               z = 0;
               NS = x ? s3 : s1;
          end  

          s3 : begin
               z = x ? 0 : 1;
               NS = x ? s0 : s1;
          end          
       endcase
endmodule
