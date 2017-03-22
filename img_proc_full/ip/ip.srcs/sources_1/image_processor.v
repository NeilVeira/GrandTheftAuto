//////////////////////////////////////////////////////////////////////////////////
// Company: University of Toronto
// Engineer: Neil Veira
// 
// Create Date: 03/08/2017 11:37:38 PM
// Design Name: GrandTheftAuto
// Module Name: image_processor
// Project Name: GrandTheftAuto (ECE532)
// Target Devices: artix7
// Tool Versions: Vivado 2016.2
// Description: This module ties together the jpeg decoder and the edge detector. 
//		It contains logic and a buffer to convert from the jpeg decoder's output in 16x16
//		blocks to the edge_dector's input in row-major order. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module image_processor (
    input Clk,
    input clk_25,
    input [31:0] data_i,
    input reset_i,
    output eoi_o,
    output error_o,
    output [3:0] context_o,
    output [7:0] red_o,
    output [7:0] green_o,
    output [7:0] blue_o,
    output [15:0] width_o,
    output [15:0] height_o,
    //output [1:0] sampling_o,
    output datavalid_o,
    input datavalid_i,
    input ready_i,
    output ready_o,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    output H,
    output V
    );

    jpeg jpeg_inst (
        .Clk(Clk),
        .data_i(data_i),
        .reset_i(reset_i),
        .eoi_o(eoi_o),
        .error_o(error_o),
        .context_o(context_o),
        .red_o(red_o),
        .green_o(green_o),
        .blue_o(blue_o),
        .width_o(width_o),
        .height_o(height_o),
        //.sampling_o(sampling_o),
        .datavalid_i(datavalid_i),
        .datavalid_o(datavalid_o),
        .ready_i(ready_i),
        .ready_o(ready_o)
    );
    
    wire new_image; 
    
    //compute x and y in the weird 16x16 block way that jpeg produces data
    reg [9:0] x;
    reg [9:0] y;
    //(x_base, y_base) = coordinate of first pixel in 16x16 block
    reg [9:0] x_base;
    reg [9:0] y_base;
    
    wire ed_go; 
    //ed_ymax: edge detector is allowed to go until y reaches this value.
    //Not all pixels are ready for y >= ed_ymax
    wire [9:0] ed_ymax; 
    reg [9:0] ed_x;
    reg [9:0] ed_y;
    
    always @ (negedge datavalid_o or posedge new_image or posedge reset_i) begin
        if (reset_i | new_image) begin
            x_base <= 0;
            y_base <= 0;
        end else if (x_base + 16 >= width_o) begin
            y_base <= y_base+16;
            x_base <= 0;
        end else begin 
            x_base <= x_base+16;
        end
    end
    
    always @ (posedge Clk) begin 
        if (reset_i | new_image) begin 
            x <= 0;
            y <= 0;
        end else if (datavalid_o) begin
            if (x == x_base+15) begin
                y <= y+1;
                x <= x_base;
            end else begin
                x <= x+1;
            end
        end else begin 
            x <= x_base;
            y <= y_base;
        end
    end 
    
    //compute x & y for the edge detector
    assign ed_ymax = y_base;
    assign new_image = (ed_y >= height_o-1) && (ed_x >= width_o);
    
    always @ (posedge Clk) begin 
        if (reset_i | new_image) begin 
            ed_x <= 0;
            ed_y <= 0;
        end else if (ed_y < ed_ymax) begin  //never let y get to ed_ymax
            if (ed_y+1 == ed_ymax) begin 
                //case where next ed_y would be ed_ymax. 
                //Don't increment y. Just let x go until the end.
                if (ed_x < width_o) 
                    ed_x <= ed_x+1;
            end else begin 
                //normal case where we increment x until the end of the row, at which 
                //point we increment y and reset x
                if (ed_x+1 >= width_o) begin 
                    ed_x <= 0;
                    ed_y <= ed_y+1;
                end else begin 
                    ed_x <= ed_x+1; 
                end
            end
        end
    end
    
    assign ed_go = (ed_y < ed_ymax && ed_x < width_o); 
    
    //bram signals for buffering pixels between jpeg decoder and edge detector
    wire [14:0] bram_addrin;
    wire [14:0] bram_addrout;
    wire [23:0] bram_din;
    wire [23:0] bram_dout;
    wire bram_we; 
    
    assign bram_addrin = (y[4:0])*width_o + x; //y[4:0] = y mod 32
    assign bram_addrout = (ed_y[4:0])*width_o + ed_x;
    assign bram_din[23:16] = red_o;
    assign bram_din[15:8] = green_o;
    assign bram_din[7:0] = blue_o;
    assign bram_we = datavalid_o;
    
    //this ram buffers pixels output from the jpeg decoder until the edge detector
    //can read them
    blk_mem_gen_0 jpeg_buffer (
        .clka(Clk),    // input wire clka
        .wea(bram_we),      // input wire [0 : 0] wea
        .addra(bram_addrin),  // input wire [14 : 0] addra
        .dina(bram_din),    // input wire [23 : 0] dina
        .clkb(Clk),    // input wire clkb
        .addrb(bram_addrout),  // input wire [14 : 0] addrb
        .doutb(bram_dout)  // output wire [23 : 0] doutb
    );
    
    wire edge_wren;
    wire [19:0] edge_out;
    wire colour;
    
    edge_detector #(
        .target_r(180),
        .target_g(45),
        .target_b(60),
        .error_threshold(5000)
    ) edge_detector_inst (
        .r(bram_dout[23:16]),
        .g(bram_dout[15:8]),
        .b(bram_dout[7:0]),
        .x(ed_x),
        .y(ed_y),
        .W(width_o),
        .go(ed_go),
        .clk(Clk),
        .rst(~reset_i), //reset_i is active high
        .wren(edge_wren),
        .edge_out(edge_out),
        .colour(colour)
    );
    
    //bram signals for buffering edge pixels from the edge detector to the microblaze 
    wire edge_buffer_wren;
    reg [12:0] edge_buffer_addrin;
    wire [19:0] edge_buffer_din;
    wire edge_buffer_rden;              //to be set by microblaze
    wire [12:0] edge_buffer_addrout;    //to be set by microblaze
    wire [19:0] edge_buffer_dout;       //to be read by microblaze
    reg [11:0] edge_cnt;
    
    assign edge_buffer_wren = edge_wren; 
    assign edge_buffer_din = edge_out-2; //the -2 accounts for an offset of 2 in the x coordinate
                                        //due to a 2-cycle delay reading pixels from the edge_buffer
    
    //signals for edge_fifo 
    reg edge_fifo_wren;
    reg [11:0] edge_fifo_din;
    wire edge_fifo_rden;                //to be set by microblaze
    wire [11:0] edge_fifo_dout;         //to be read by microblaze
    wire edge_fifo_full;                //to be read by microblaze
    wire edge_fifo_empty;               //to be read by microblaze
    assign edge_fifo_rden = 0; //temporary - remove later
    
    always @ (posedge Clk) begin 
        if (reset_i | edge_fifo_wren) begin //make sure edge_fifo_wren is only high for 1 cycle
            edge_buffer_addrin <= 0;
            edge_cnt <= 0;
            edge_fifo_wren <= 0;
        end else if ((ed_y >= height_o-1) && (ed_x >= width_o)) begin 
            //this condition indicates that the edge detector has reached the end of the image 
            //write edge_cnt to the edge_fifo and reset it
            edge_fifo_din <= edge_cnt;
            edge_cnt <= 0;
            edge_fifo_wren <= 1;
        end else if (edge_wren) begin 
            edge_buffer_addrin <= edge_buffer_addrin + 1;
            edge_cnt <= edge_cnt+1;
        end 
    end
    
    //this ram stores edge pixels output from the edge detector 
    blk_mem_gen_1 edge_buffer (
        .clka(Clk),                     // input wire clka
        .wea(edge_buffer_wren),         // input wire [0 : 0] wea
        .addra(edge_buffer_addrin),     // input wire [12 : 0] addra
        .dina(edge_buffer_din),         // input wire [19 : 0] dina
        .clkb(Clk),                     // input wire clkb
        .addrb(edge_buffer_addrout),    // input wire [12 : 0] addrb
        .doutb(edge_buffer_dout)        // output wire [19 : 0] doutb
    );
    
    //this fifo stores the number of edge pixels for each image
    fifo_generator_0 edge_fifo (
        .clk(Clk),      // input wire clk
        .din(edge_fifo_din),      // input wire [11 : 0] din
        .wr_en(edge_fifo_wren),  // input wire wr_en
        .rd_en(edge_fifo_rden),  // input wire rd_en
        .dout(edge_fifo_dout),    // output wire [11 : 0] dout
        .full(edge_fifo_full),    // output wire full
        .empty(edge_fifo_empty)  // output wire empty
    );
    
    
    vga_controller vga_controller_inst (
        .clk_100(Clk),
        .clk_25(clk_25),
        .width(width_o),
        .height(height_o),
        .ed_x(ed_x),
        .ed_y(ed_y),
        .edge_wren(edge_wren),
        .ed_go(ed_go),
        .colour(colour),
        .R(R),
        .G(G),
        .B(B),
        .H(H),
        .V(V)
    );

endmodule