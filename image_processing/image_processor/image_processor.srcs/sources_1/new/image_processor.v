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
    //parameters for colour detection
    parameter integer target_r = 255, 
    parameter integer target_g = 255,
    parameter integer target_b = 255,
    parameter integer loss_threshold = 3500,
    
    //dimensions of all images
    parameter integer W = 50,
    parameter integer H = 50,
    
    //parameters for edge detection
    parameter integer K = 4, //window size
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
    output reg colour,
    
    //fifo ports
    output wire full, //for testing - should never be high
    output wire empty,
    input wire rd_en,
    output wire [15:0] dout
    );
    
wire [16:0] loss;
assign loss = (r-target_r)*(r-target_r) + (g-target_g)*(g-target_g) + (b-target_b)*(b-target_b);
reg [7:0] x;
reg [7:0] y;

localparam sz = (2*K+1)*W;
reg [sz-1 : 0] cur_pixels;

always @(posedge clk)
begin
    //store x,y in registers to allow for delay reading from buffer
    if (~rst) begin
        cur_pixels <= 0;
        colour <= 0;
        x <= -1; //hack: x and y should be 0 for the entire first cycle that data_valid is high
        y <= 0;
    end
    else if (data_valid) begin 
        if (x == W-1) begin
            x <= 0;
            y <= y+1;
        end else begin
            x <= x+1;
        end
    
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
wire wr_en;
wire [15:0] din;

assign wr_en = (y >= 2*K && x >= 2*K && //need to have processed a full window to be valid
                min_sum <= sum && sum <= max_sum) ? 1 : 0;
assign din[15:8] = y - K;
assign din[7:0] = x - K;

fifo_generator_0 edge_pixels (
  .clk(clk),      // input wire clk
  .din(din),      // input wire [15 : 0] din
  .wr_en(wr_en),  // input wire wr_en
  .rd_en(rd_en),  // input wire rd_en
  .dout(dout),    // output wire [15 : 0] dout
  .full(full),    // output wire full
  .empty(empty)  // output wire empty
);

/*
//write colour of this pixel to buffer
//compute address (pixel index in row-major order)
reg [15:0] wr_addr;
reg [15:0] rd_addr;
always @ (posedge clk)
begin
    wr_addr <= y*W + x-1;
    rd_addr <= (y-2*K-1)*W + x;
end
//assign wr_addr = y*W + x;
//assign rd_addr = (y-2*K-1)*W + x;

wire prev_pix;

//simple dual port ram
blk_mem_gen_0 buffer (
  .clka(clk),    // input wire clka
  .wea(1'b1),      // input wire [0 : 0] wea
  .addra(wr_addr),  // input wire [15 : 0] addra
  .dina(colour),    // input wire [0 : 0] dina
  .clkb(clk),    // input wire clkb
  .addrb(rd_addr),  // input wire [15 : 0] addrb
  .doutb(prev_pix)  // output wire [0 : 0] doutb
);

wire [7:0] colsum;
assign colsum = colour;*/

endmodule
