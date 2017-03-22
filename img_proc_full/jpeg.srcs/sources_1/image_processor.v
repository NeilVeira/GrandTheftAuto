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
    //control signals
    input datavalid_i,
    input ready_i,
    output ready_o,
    input calibrate,
    output error_o,
    //vga output signals
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    output H,
    output V,
    //signals for storing edges in ram 
    input [1:0] microblaze_read,
    output reg [1:0] img_proc_write,
    output reg [12:0] edge_ram_addr,
    output [19:0] edge_ram_din,
    output edge_ram_wren
    );
    
    (* dont_touch = "true" *) wire jpeg_ready_o;
    (* dont_touch = "true" *) wire datavalid_o;
    (* dont_touch = "true" *) wire [7:0] red_o;
    (* dont_touch = "true" *) wire [7:0] green_o;
    (* dont_touch = "true" *) wire [7:0] blue_o;
    (* dont_touch = "true" *) wire [15:0] width_o;
    (* dont_touch = "true" *) wire [15:0] height_o;

    jpeg jpeg_inst (
        .Clk(Clk),
        .data_i(data_i),
        .reset_i(reset_i),
        .eoi_o(),
        .error_o(error_o),
        .context_o(),
        .red_o(red_o),
        .green_o(green_o),
        .blue_o(blue_o),
        .width_o(width_o),
        .height_o(height_o),
        //.sampling_o(sampling_o),
        .datavalid_i(datavalid_i),
        .datavalid_o(datavalid_o),
        .ready_i(ready_i),
        .ready_o(jpeg_ready_o)
    );
    
    //This is a hack because the jpeg decoder is messed up and sends ready high long //and takes in several more images long before it's finished processing the 
    //previous one and then gives garbage output. 
    //Note: the input data must have ffd8ffe0 all in the same word! 
    
    parameter WAITING = 0, ACCEPTING=1, SEEN_FF=2, DECODING=3;
    //WAITING:      Doing nothing - waiting for data 
    //ACCEPTING:    Seen the beginning of the image but not the end. Processing and     
    //              still accepting more data.
    //SEEN_FF:      Substate of ACCEPTING where we've seen ff at the end of the word and are 
    //              waiting for d9 at the start of the next word to confirm end of image. 
    //DECODING:     Seen the end of the image but still decoding it. Not accepting 
    //              any more data.              
    reg [1:0] state, next;
    always @(reset_i,data_i,new_image) begin 
        if (reset_i | new_image)
            next = WAITING;
        else if (datavalid_i) begin
            case (state)
            WAITING:
                next = (data_i == 32'hffd8ffe0) ? ACCEPTING : WAITING;
            ACCEPTING:
                if (data_i[31:16]==16'hffd9 || data_i[23:8]==16'hffd9 || data_i[15:0]==16'hffd9) begin
                    next = DECODING;
                end else if (data_i[7:0]==8'hff) begin
                    next = SEEN_FF;
                end else begin
                    next = ACCEPTING;
                end
            SEEN_FF:
                next = (data_i[31:24] == 8'hd9) ? DECODING : ACCEPTING;
            DECODING:
                next = new_image ? WAITING : DECODING;
            endcase
        end else begin 
            next = state;
        end
    end
    
    always @(posedge Clk) begin
        state <= next;
    end
    assign ready_o = jpeg_ready_o && (state != DECODING);
 
    
    //detect when we're done with the image
    (* dont_touch = "true" *) reg new_image; 
    reg new_image_delay1; 
    always @ (posedge Clk) begin
        if (new_image) 
            new_image <= 0;
        else if (ed_y >= height_o-1 && ed_x >= width_o) 
        //else if (datavalid_i && data_i == 32'hffd8ffe0)
            new_image <= 1;
    end
    
    always @(posedge Clk) begin 
        new_image_delay1 <= new_image;
    end 
    
    //compute x and y in the weird 16x16 block way that jpeg produces data
    (* dont_touch = "true" *) reg [9:0] x;
    (* dont_touch = "true" *) reg [9:0] y;
    //(x_base, y_base) = coordinate of first pixel in 16x16 block
    (* dont_touch = "true" *) reg [9:0] x_base;
    (* dont_touch = "true" *) reg [9:0] y_base;
    
    (* dont_touch = "true" *) wire ed_go; 
    //ed_ymax: edge detector is allowed to go until y reaches this value.
    //Not all pixels are ready for y >= ed_ymax
    (* dont_touch = "true" *) wire [9:0] ed_ymax; 
    (* dont_touch = "true" *) reg [9:0] ed_x;
    (* dont_touch = "true" *) reg [9:0] ed_y;
    
    always @ (negedge datavalid_o or posedge new_image or posedge reset_i) begin
        if (new_image | reset_i) begin
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
        if (new_image | reset_i) begin 
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
    always @ (posedge Clk) begin 
        if (new_image | reset_i) begin 
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
    
    assign ed_go = ~reset_i && (ed_y < ed_ymax && ed_x < width_o); 
    
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
    
    //in calibrate mode, set target colour to the center pixel
    reg [7:0] target_r;
    reg [7:0] target_g;
    reg [7:0] target_b;  
    
    always @ (posedge Clk) begin
        if (reset_i) begin 
            //default values
            target_r <= 180;
            target_g <= 45;
            target_b <= 60;
        end else if (calibrate && datavalid_o && x == width_o[10:1] && y == height_o[10:1]) begin 
            target_r <= red_o;
            target_g <= green_o;
            target_b <= blue_o;
        end else begin
            target_r <= target_r;
            target_g <= target_g;
            target_b <= target_b;
        end
    end
    
    
    wire colour;
    wire edge_valid;
    wire [19:0] edge_out;
    
    edge_detector #(
        .error_threshold(5000)
    ) edge_detector_inst (
        .r(bram_dout[23:16]),
        .g(bram_dout[15:8]),
        .b(bram_dout[7:0]),
        .target_r(target_r),
        .target_g(target_g),
        .target_b(target_b),
        .x(ed_x),
        .y(ed_y),
        .W(width_o),
        .go(ed_go),
        .clk(Clk),
        .rst(~reset_i), //reset_i is active high
        .calibrate(calibrate),
        .edge_valid(edge_valid),
        .edge_out(edge_out),
        .colour(colour)
    );
    
    reg [12:0] edge_ram_base_addr;
    
    //figure out which section of the ram to write to
    always @(posedge Clk) begin 
        if (reset_i) 
            img_proc_write <= 2'b00;
        else if (new_image) begin 
            case (img_proc_write) 
            0:
                img_proc_write <= microblaze_read == 1 ? 2 : 1;
            1:
                img_proc_write <= microblaze_read == 0 ? 2 : 0;
            2:
                img_proc_write <= microblaze_read == 0 ? 1 : 0;
            endcase
        end
    end 
    
    //compute address for edge ram 
    always @(posedge Clk) begin 
        if (reset_i) begin
            edge_ram_addr <= 0;
        end else if (new_image_delay1) begin 
            edge_ram_addr <= 2048 * img_proc_write; //base address of current section of ram 
        end else if (edge_valid) begin
            //Make sure we don't write past the end of this section, just in case it 
            //turns out not be big enough. The current section will be wrong, but at least 
            //the section that the microblaze is reading from is still intact. 
            if (edge_ram_addr >= 2048*(img_proc_write+1)-1)
                edge_ram_addr <= 2048*(img_proc_write);
            else
                edge_ram_addr <= edge_ram_addr+1;
        end 
    end
    
    //write fffff on new_image cycle to mark end of edge list 
    assign edge_ram_wren = (edge_valid | new_image) & ~calibrate; 
    assign edge_ram_din = new_image ? 20'hfffff : edge_out;
    
    vga_controller vga_controller_inst (
        .clk_100(Clk),
        .clk_25(clk_25),
        .width(width_o),
        .height(height_o),
        .ed_x(ed_x),
        .ed_y(ed_y),
        .edge_valid(edge_valid),
        .ed_go(ed_go),
        .colour(colour),
        .R(R),
        .G(G),
        .B(B),
        .H(H),
        .V(V)
    );

endmodule