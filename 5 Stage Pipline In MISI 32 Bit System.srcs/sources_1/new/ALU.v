module ID_EX(
    input pwrite2, 
    input clk,
    input [31:0] sign_extended32, 
    input [31:0] read_Rs, 
    input [31:0] read_Rt, 
    input [31:0] newPC,
    input [25:0] lower26,
    input [9:0] control_signals,
    output reg [163:0] new_content
);

    always @ (negedge clk) begin
        if (pwrite2)
            new_content <= {sign_extended32, read_Rs, read_Rt, lower26, newPC, control_signals};
        else
            new_content <= 164'b0;
    end

endmodule
