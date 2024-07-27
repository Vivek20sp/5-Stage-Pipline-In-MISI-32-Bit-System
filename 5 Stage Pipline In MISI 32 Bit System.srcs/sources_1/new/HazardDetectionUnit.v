module HazardDetectionUnit(
    input clk, 
    input MemRead2,
    input [4:0] Rs1, 
    input [4:0] Rt1, 
    input [4:0] Rt2,
    output reg [2:0] stall
);

    always @ (negedge clk) begin
        if (MemRead2 && ((Rt2 == Rs1) || (Rt2 == Rt1)))
            stall <= 3'b000; // Pipeline stall
        else
            stall <= 3'b111; // No stall
    end

endmodule
