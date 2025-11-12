module cyclic_lamp(clock,light);
     input clock;
     output reg[2:0] light;
     parameter s0 = 2'b00, s1 =2'b01, s2 = 2'b10;
     parameter RED = 3'b100 , YELLOW = 3'b001 ,GREEN = 3'b010;
     reg [1:0] state;
     always @(posedge clock)
        case(state)
             s0 : state <= s1 ;
             s1 : state <= s2 ;
             s2 : state <= s0 ;
             default:state <= s0;
        endcase       

     always @(state)   
         case (state)
            s0: light = RED;
            s1: light = GREEN;
            s2: light = YELLOW; 
            default: light = RED;
         endcase
endmodule         
