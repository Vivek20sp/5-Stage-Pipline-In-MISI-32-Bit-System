module MEM_WB (
    output reg [72:0] new_content,
    input [31:0] ALU_Output, memory_data,
    input [4:0] destination_reg,
    input [1:0] control_signals,
    input clk, pwrite4, reset
);
    // On the negative edge of the clock or reset signal
    always @ (negedge clk or posedge reset) begin
        if (reset)
            new_content <= 73'b0; // Clear new_content on reset
        else if (pwrite4)
            new_content <= {destination_reg, ALU_Output, memory_data, control_signals}; // Update new_content
        else
            new_content <= 73'b0; // Clear new_content if pwrite4 is not set
    end
endmodule
