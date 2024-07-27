module DataForwardingUnit(
    input RegWrite3, 
    input RegWrite4, 
    input clk,
    input [4:0] Rs2, 
    input [4:0] Rt2, 
    input [4:0] destreg3, 
    input [4:0] destreg4,
    output reg [1:0] forwardA, 
    output reg [1:0] forwardB
);

    always @ (negedge clk) begin
        // Forwarding logic for Rs2
        if (RegWrite3 & (destreg3 != 0) & (destreg3 == Rs2))
            forwardA <= 2'b10;
        else if (RegWrite4 & (destreg4 != 0) & (destreg3 != Rs2) & (destreg4 == Rs2))
            forwardA <= 2'b01;
        else
            forwardA <= 2'b00;
        
        // Forwarding logic for Rt2
        if (RegWrite3 & (destreg3 != 0) & (destreg3 == Rt2))
            forwardB <= 2'b10;
        else if (RegWrite4 & (destreg4 != 0) & (destreg3 != Rt2) & (destreg4 == Rt2))
            forwardB <= 2'b01;
        else
            forwardB <= 2'b00;
    end

endmodule
