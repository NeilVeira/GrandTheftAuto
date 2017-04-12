`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Toronto
// Engineer: Neil Veira 
// 
// Create Date: 04/12/2017 11:02:04 AM
// Design Name: JPEG decoder
// Module Name: jpeg_decoder
// Project Name: JPEG deoder
// Target Devices: Artix 7
// Tool Versions: Vivado 2016.2
// Description: Top-level module for the jpeg decoder project. Serves as a 
//      wrapper on top of the original "jpeg" module from opencores and 
//      contains logic to work around some bugs in it.
//
// Dependencies: jpeg.vhd
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module jpeg_decoder(
    input clk,
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
    output reg [9:0] x_o,
    output reg [9:0] y_o,
    input datavalid_i,
    output datavalid_o,
    input ready_i,
    output ready_o
    );
    
    //This is a hack because the jpeg decoder screws up when given data with large 
    //gaps of datavalid_i=0 between words. This fifo buffers the data until we have 
    //a lot piled up and then sends it all in consecutive cycles.  
    
    (* dont_touch = "true" *) wire rd_en;
    (* dont_touch = "true" *) wire [31:0] jpeg_data_i;
    (* dont_touch = "true" *) wire full, almost_full, empty;
    (* dont_touch = "true" *) wire jpeg_ready_o;    
    (* dont_touch = "true" *) wire jpeg_ready_hack;    
    (* dont_touch = "true" *) wire jpeg_datavalid_i; 
    
    fifo_generator_0 data_in_buffer (
        .clk(clk),                  // input wire clk
        .rst(reset_i),                // input wire srst
        .din(data_i),                  // input wire [31 : 0] din
        .wr_en(datavalid_i),              // input wire wr_en
        .rd_en(rd_en),              // input wire rd_en
        .dout(jpeg_data_i),                // output wire [31 : 0] dout
        .full(full),                // output wire full
        .prog_full(almost_full),  // output wire almost_full
        .empty(empty)              // output wire empty
    );
    
    //logic for determining when to read out from the fifo
    parameter WAITING_FOR_DATA=0, SENDING_DATA=1, WAITING_FOR_READY=2;
    (* dont_touch = "true" *) reg [1:0] fifo_state, fifo_next_state;
    
    always @(posedge clk) begin 
        case (fifo_state) 
        WAITING_FOR_DATA:
            if (almost_full) 
                fifo_next_state = WAITING_FOR_READY;
            else 
                fifo_next_state = WAITING_FOR_DATA;
        SENDING_DATA:
            if (~jpeg_ready_hack || empty) 
                fifo_next_state = WAITING_FOR_DATA;
            else 
                fifo_next_state = SENDING_DATA;
        WAITING_FOR_READY:
            if (jpeg_ready_hack) 
                fifo_next_state = SENDING_DATA;
            else 
                fifo_next_state = WAITING_FOR_READY;
        endcase
        fifo_state <= fifo_next_state;
    end     
    
    assign rd_en = (fifo_state == SENDING_DATA) && ~empty && jpeg_ready_hack;
    assign ready_o = ~full;
	assign jpeg_datavalid_i = rd_en & jpeg_ready_hack;

    jpeg jpeg_inst (
        .Clk(clk),
        .data_i(jpeg_data_i),
        .reset_i(reset_i | new_image),
        //.eoi_o(eoi_o),
        .error_o(error_o),
        .context_o(context_o),
        .red_o(red_o),
        .green_o(green_o),
        .blue_o(blue_o),
        .width_o(width_o),
        .height_o(height_o),
        //.sampling_o(sampling_o),
        .datavalid_i(jpeg_datavalid_i),
        .datavalid_o(datavalid_o),
        .ready_i(ready_i),
        .ready_o(jpeg_ready_o)
    );
    
    //This is a hack because the jpeg decoder sends ready_o high and reads in several more 
    //images long before it's finished processing the previous one and then gives garbage output. 
    //Note: the input data must have ffd8ffe0 all in the same word! 
    
    parameter WAITING = 0, ACCEPTING=1, SEEN_FF=2, DECODING=3;
    //WAITING:      Doing nothing - waiting for data 
    //ACCEPTING:    Seen the beginning of the image but not the end. Processing and     
    //              still accepting more data.
    //SEEN_FF:      Substate of ACCEPTING where we've seen ff at the end of the word and are 
    //              waiting for d9 at the start of the next word to confirm end of image. 
    //DECODING:     Seen the end of the image but still decoding it. Not accepting 
    //              any more data.              
    (* dont_touch = "true" *) reg [1:0] image_state, image_next_state;
    always @(posedge clk) begin 
        if (reset_i | new_image)
            image_next_state = WAITING;
        else if (jpeg_datavalid_i) begin
            case (image_state)
            WAITING:
                image_next_state = (jpeg_data_i == 32'hffd8ffe0) ? ACCEPTING : WAITING;
            ACCEPTING:
                if (jpeg_data_i[31:16]==16'hffd9 || jpeg_data_i[23:8]==16'hffd9 || jpeg_data_i[15:0]==16'hffd9) begin
                    image_next_state = DECODING;
                end else if (jpeg_data_i[7:0]==8'hff) begin
                    image_next_state = SEEN_FF;
                end else begin
                    image_next_state = ACCEPTING;
                end
            SEEN_FF:
                image_next_state = (jpeg_data_i[31:24] == 8'hd9) ? DECODING : ACCEPTING;
            DECODING:
                image_next_state = new_image ? WAITING : DECODING;
            endcase
        end else begin 
            image_next_state = image_state;
        end
        image_state <= image_next_state;
    end
    
    assign jpeg_ready_hack = jpeg_ready_o && (image_state != DECODING);
    
    //detect when we're done with the image
    (* dont_touch = "true" *) reg new_image;  
    always @ (posedge clk) begin
        if (new_image) 
            new_image <= 0;
        else if (height_o > 0 && y_o == height_o) 
            new_image <= 1;
    end
    assign eoi_o = new_image;
    
    //Compute x and y in the 16x16 block way that jpeg produces data.
    //(x_block, y_block) = coordinate of first pixel in 16x16 block
    (* dont_touch = "true" *) reg [9:0] x_block;
    (* dont_touch = "true" *) reg [9:0] y_block;
    
    always @ (negedge datavalid_o or posedge new_image or posedge reset_i) begin
        if (new_image | reset_i) begin
            x_block <= 0;
            y_block <= 0;
        end else if (x_block + 16 >= width_o) begin
            y_block <= y_block+16;
            x_block <= 0;
        end else begin 
            x_block <= x_block+16;
        end
    end
    
    always @ (posedge clk) begin 
        if (new_image | reset_i) begin 
            x_o <= 0;
            y_o <= 0;
        end else if (datavalid_o) begin
            if (x_o == x_block+15) begin
                y_o <= y_o+1;
                x_o <= x_block;
            end else begin
                x_o <= x_o+1;
            end
        end else begin 
            x_o <= x_block;
            y_o <= y_block;
        end
    end 

endmodule
