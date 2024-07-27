`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 11:05:48
// Design Name: 
// Module Name: ID_EX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
