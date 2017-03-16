`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Toronto
// Engineer: Neil Veira
// 
// Create Date: 02/14/2017 08:38:50 PM
// Design Name: Image Processor
// Module Name: edge_detector
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
    parameter integer error_threshold = 3500,
    
    //dimensions of all images
    //parameter integer W = 64,
    //parameter integer H = 64,
     
    //parameters for edge detection
    parameter integer K = 4, //half window size
    parameter real LOW = 0.444,
    parameter real HIGH = 0.545
)
(
    input [7:0] r,
    input [7:0] g,
    input [7:0] b,
    input go,
    input clk,
    input rst, //active low
    input [9:0] x,
    input [9:0] y,
    input [15:0] W,
    
    //fifo ports
    output wire wren,
    output wire [19:0] edge_out,
    output wire colour
    );
    
    wire [16:0] error;
    assign error = (r-target_r)*(r-target_r) + (g-target_g)*(g-target_g) + (b-target_b)*(b-target_b);
    assign colour = (error < error_threshold) ? 1 : 0;

    localparam sz = (2*K+1)+3; 
    reg [sz-1 : 0] cur_pixels;

    always @(posedge clk)
    begin
        //store x,y in registers to allow for delay reading from buffer
        if (~rst) begin
            cur_pixels <= 0;
        end
        else if (go) begin         
            cur_pixels[sz-1:1] <= cur_pixels[sz-2:0];
            cur_pixels[0] <= (error < error_threshold) ? 1 : 0;
        end
    end
    

    reg [3:0] cur_row_sum;
    
    integer idx;
    always @* 
    begin
        cur_row_sum = 4'b0000;
        for (idx=0; idx<2*K+1; idx=idx+1) begin
            cur_row_sum = cur_row_sum + cur_pixels[idx];
        end
    end
    
    wire [31:0] row_sums_out; //sum of previous 8 rows for this column
    wire [31:0] row_sums_in;
    wire [9:0] wr_addr;
    assign wr_addr = x < 2 ? x+W-2 : x-2;
    assign row_sums_in[31:4] = row_sums_out[27:0];
    assign row_sums_in[3:0] = cur_row_sum; 
    
    blk_mem_gen_3 row_sums (
        .clka(clk),    // input wire clka
        .wea(go),      // input wire [0 : 0] wea
        .addra(wr_addr),  // input wire [9 : 0] addra
        .dina(row_sums_in),    // input wire [31 : 0] dina
        .clkb(clk),    // input wire clkb
        .addrb(x),  // input wire [9 : 0] addrb
        .doutb(row_sums_out)  // output wire [31 : 0] doutb
    );

    //sum over all 8 row sums in row_sums_out and current row
    reg [7:0] sum;
    integer i;
    always @* begin
        sum = 8'b00000000;
        for (i=0; i<2*K; i=i+1) begin 
            sum = sum + 8*row_sums_out[4*i+3] + 4*row_sums_out[4*i+2] + 2*row_sums_out[4*i+1] + 1*row_sums_out[4*i+0];
        end
        sum = sum + cur_row_sum;
    end
    
    //decide whether this pixel is an edge by comparing to the threshold
    //write edge pixels to fifo
    localparam integer min_sum = LOW*(2*K+1)*(2*K+1);
    localparam integer max_sum = HIGH*(2*K+1)*(2*K+1);

    //fifo stuff
    assign wren = (go && 
                        y >= 2*K && x >= 2*K && //need to have processed a full window to be valid
                        min_sum <= sum && sum <= max_sum) ? 1 : 0;
    assign edge_out[19:10] = y - K;
    assign edge_out[9:0] = x - K; //-3 for some constant offset due to timing

endmodule
