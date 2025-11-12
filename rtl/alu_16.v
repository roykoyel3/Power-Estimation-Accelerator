module ALU (X, Y, Z, Sign, Carry, Zero, Parity, Overflow);
    input [15:0] X, Y;
    output [15:0] Z;
    output Sign, Carry, Zero, Parity, Overflow;

    reg [16:0] temp_sum;   // 17 bits to hold carry
    reg [15:0] Z_reg;
    reg Carry_reg, Sign_reg, Zero_reg, Parity_reg, Overflow_reg;

    assign Z = Z_reg;
    assign Carry = Carry_reg;
    assign Sign = Sign_reg;
    assign Zero = Zero_reg;
    assign Parity = Parity_reg;
    assign Overflow = Overflow_reg;

    always @(*) begin
        temp_sum = X + Y;           // arithmetic operation
        Z_reg = temp_sum[15:0];     // lower 16 bits
        Carry_reg = temp_sum[16];   // MSB carry
        Sign_reg = Z_reg[15];       // sign bit
        Zero_reg = (Z_reg == 16'b0);
        Parity_reg = ^Z_reg;        // XOR of bits
        Overflow_reg = (X[15] == Y[15]) && (Z_reg[15] != X[15]);
    end
endmodule

