/*
This module ties together the jpeg decoder and the edge detector. 
It contains logic and a buffer to convert from the jpeg decoder's output in 16x16
blocks to the edge_dector's input in row-major order. 
*/

`timescale 1ns / 1ps

module image_processor (
    input Clk,
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
    input datavalid_i,
    output datavalid_o,
    input ready_i,
    output ready_o
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
    
    wire fifo_wr_en;
    wire [15:0] fifo_din;
    
    //compute x and y in the weird 16x16 block way that jpeg produces data
    reg [7:0] x;
    reg [7:0] y;
    //(x_base, y_base) = coordinate of first pixel in 16x16 block
    reg [7:0] x_base;
    reg [7:0] y_base;
    
    wire ed_go; 
    //ed_ymax: edge detector is allowed to go until y reaches this value.
    //Not all pixels are ready for y >= ed_ymax
    wire [7:0] ed_ymax; 
    reg [7:0] ed_x;
    reg [7:0] ed_y;
    
    always @ (negedge datavalid_o) begin
        if (reset_i) begin 
            x_base <= 0;
            y_base <= 0;
        end else begin
            if (x_base + 16 >= width_o) begin
                y_base <= y_base+16;
                x_base <= 0;
            end
            else begin 
                x_base <= x_base+16;
            end
        end
    end
    
    always @ (posedge datavalid_o) begin 
        x <= x_base;
        y <= y_base;
    end 
    
    always @ (posedge Clk) begin 
        if (reset_i) begin 
            x <= 0;
            y <= 0;
        end else if (datavalid_o) begin
            if (x == x_base+15) begin
                y <= y+1;
                x <= x_base;
            end else begin
                x <= x+1;
            end
        end
    end 
    
    //compute x & y for the edge detector
    assign ed_ymax = y_base;
    
    always @ (posedge Clk) begin 
        if (reset_i) begin 
            ed_x <= 0;
            ed_y <= 0;
        end else if (ed_y < ed_ymax) begin  //never let y get to ed_ymax
            if (ed_y+1 == ed_ymax) begin 
                //case where next ed_y would be ed_ymax. 
                //Don't increment y. Just let x go until the end and then sit there.
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
    
    //bram signals
    wire [12:0] bram_addrin;
    wire [12:0] bram_addrout;
    wire [23:0] bram_din;
    wire [23:0] bram_dout;
    wire bram_we; 
    
    assign bram_addrin = (y[4:0])*width_o + x; //y[4:0] = y mod 32
    assign bram_addrout = (ed_y[4:0])*width_o + x;
    assign bram_din[23:16] = red_o;
    assign bram_din[15:8] = green_o;
    assign bram_din[7:0] = blue_o;
    assign bram_we = datavalid_o;
    
    blk_mem_gen_0 jpeg_buffer (
        .clka(Clk),    // input wire clka
        .wea(bram_we),      // input wire [0 : 0] wea
        .addra(bram_addrin),  // input wire [12 : 0] addra
        .dina(bram_din),    // input wire [23 : 0] dina
        .clkb(Clk),    // input wire clkb
        .addrb(bram_addrout),  // input wire [12 : 0] addrb
        .doutb(bram_dout)  // output wire [23 : 0] doutb
    );
    
    
    edge_detector edge_detector_inst (
        .r(bram_dout[23:16]),
        .g(bram_dout[15:8]),
        .b(bram_dout[7:0]),
        .x(ed_x),
        .y(ed_y),
        .data_valid(ed_go),
        .clk(Clk),
        .rst(~reset_i), //reset_i is active high
        .fifo_wr_en(fifo_wr_en),
        .fifo_din(fifo_din)
    );

endmodule