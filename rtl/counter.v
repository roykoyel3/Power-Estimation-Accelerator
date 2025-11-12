//ASYNCHRONOUS COUNTER
module counter (
    input clk,         // Clock signal
    input rst,         // Reset signal (active high)
    output reg [3:0] count // 4-bit counter output
);
    always @(negedge clk or posedge rst) 
    begin
        if (rst) 
            count <= 4'b0000; // Reset counter to 0
        else 
            count <= count + 1; // Increment counter
    end
endmodule
