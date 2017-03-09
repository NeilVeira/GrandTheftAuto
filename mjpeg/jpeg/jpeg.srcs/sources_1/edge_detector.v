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


module edge_detector #(
    //parameters for colour detection
    parameter integer target_r = 180, 
    parameter integer target_g = 45,
    parameter integer target_b = 60,
    parameter integer loss_threshold = 3500,
    
    //dimensions of all images
    parameter integer W = 64,
    parameter integer H = 64,
     
    //parameters for edge detection
    parameter integer K = 4, //half window size
    parameter real LOW = 0.444,
    parameter real HIGH = 0.545
)
(
    input [7:0] r,
    input [7:0] g,
    input [7:0] b,
    input data_valid,
    input clk,
    input rst, //active low
    input [7:0] x,
    input [7:0] y,
    
    //fifo ports
    output wire fifo_wr_en,
    output wire [15:0] fifo_din
    );
    
    wire [16:0] loss;
    assign loss = (r-target_r)*(r-target_r) + (g-target_g)*(g-target_g) + (b-target_b)*(b-target_b);
    reg colour;

    localparam sz = (2*K+1)*W;
    reg [sz-1 : 0] cur_pixels;

    always @(posedge clk)
    begin
        //store x,y in registers to allow for delay reading from buffer
        if (~rst) begin
            cur_pixels <= 0;
            colour <= 0;
        end
        else if (data_valid) begin         
            cur_pixels[sz-1:1] <= cur_pixels[sz-2:0];
            cur_pixels[0] <= (loss < loss_threshold) ? 1 : 0;
            colour <= (loss < loss_threshold) ? 1 : 0;
        end
    end

    reg [7:0] sum;
    integer x_idx, y_idx;

    always @* 
    begin
        sum = 8'b00000000;
        for (y_idx=0; y_idx<2*K+1; y_idx=y_idx+1) begin
            for (x_idx=0; x_idx<2*K+1; x_idx=x_idx+1) begin
                sum = sum + cur_pixels[y_idx*W + x_idx];
            end
        end
    end

    //decide whether this pixel is an edge by comparing to the threshold
    //write edge pixels to fifo
    localparam integer min_sum = LOW*(2*K+1)*(2*K+1);
    localparam integer max_sum = HIGH*(2*K+1)*(2*K+1);

    //fifo stuff
    assign fifo_wr_en = (data_valid && 
                        y >= 2*K && x >= 2*K && //need to have processed a full window to be valid
                        min_sum <= sum && sum <= max_sum) ? 1 : 0;
    assign fifo_din[15:8] = y - K;
    assign fifo_din[7:0] = x - K;

endmodule
