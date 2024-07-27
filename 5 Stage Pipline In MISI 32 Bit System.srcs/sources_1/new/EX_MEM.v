module EX_MEM(
    input pwrite3, 
    input clk, 
    input zero,
    input [31:0] read_Rt, 
    input [31:0] ALU_Output, 
    input [31:0] branch_target,
    input [4:0] destination_reg,
    input [5:0] control_signals,
    output reg [106:0] new_content
);

    always @ (negedge clk) begin
        if (pwrite3)
            new_content <= {destination_reg, read_Rt, ALU_Output, zero, branch_target, control_signals};
        else
            new_content <= 107'b0;
    end

endmodule
