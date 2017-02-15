`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Toronto
// Engineer: Neil Veira
// 
// Create Date: 02/14/2017 08:38:50 PM
// Design Name: Image Processor
// Module Name: image_processor
// Project Name: GrandTheftAuto (ECE532)
// Target Devices: artix7
// Tool Versions: Vivado 2016.2
// Description: Extract edges of coloured regions from input image
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module image_processor #(
    parameter integer target_r = 255, 
    parameter integer target_g = 255,
    parameter integer target_b = 255,
    parameter integer loss_threshold = 3500
)
(
    input [7:0] x,
    input [7:0] y,
    input [7:0] r,
    input [7:0] g,
    input [7:0] b,
    input data_valid,
    input clk,
    input rst, //active low
    output reg colour
    );
    
wire [16:0] loss;
assign loss = (r-target_r)*(r-target_r) + (g-target_g)*(g-target_g) + (b-target_b)*(b-target_b);

always @(posedge clk)
begin
    if (~rst)
        colour <= 0;
    else if (data_valid)
        colour <= (loss < loss_threshold) ? 1 : 0;
end

endmodule
