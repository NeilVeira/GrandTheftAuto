//////////////////////////////////////////////////////////////////////////////////
// Company: University of Toronto
// Engineer: Neil Veira
// 
// Create Date: 03/13/2017 9:10:35 PM
// Design Name: GrandTheftAuto
// Module Name: vga_controller
// Project Name: GrandTheftAuto (ECE532)
// Target Devices: artix7
// Tool Versions: Vivado 2016.2
// Description: This module controls the vga output of the processed image. 
//      Given data from the edge detector, the colour for the current (ed_x,ed_y) is written to a ram 
//      of the entire image. At the same time and independently, the vga driver reads from the ram
//      for it's (column,row) coordinates and generates the R,G,B,H,V signals for the vga output. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module vga_controller (
    input clk_100,
    input clk_25,
    //data from image processor
    input [15:0] width,
    input [15:0] height,
    input [9:0] ed_x,
    input [9:0] ed_y,
    input edge_valid,
    input ed_go,
    input colour,
    //vga drive signals
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    output H,
    output V
    );

    (* dont_touch = "true" *) wire [9:0] row;
    (* dont_touch = "true" *) wire [9:0] column;
    
    //write edge-detected image to ram
    wire [18:0] mem_addra;
    wire [1:0] mem_dina;
    wire [18:0] mem_addrb;
    wire [1:0] mem_doutb;
    
    //edges are not output for the current (x,y) but for (x-K,y-K)
    assign mem_addra = edge_valid ? (ed_y-4)*width + ed_x-4 : ed_y*width + ed_x; 
    assign mem_dina = edge_valid ? 2'b10 /*green*/ :
        (colour ? 2'b01 /*red*/ :
            2'b00 /*black*/);
    wire in_range;
    assign in_range = row < height && column < width;
    assign mem_addrb = in_range ? row*width + column : 0;
    
    blk_mem_gen_2 video_mem (
        .clka(clk_100),    // input wire clka
        .wea(ed_go),      // input wire [0 : 0] wea
        .addra(mem_addra),  // input wire [18 : 0] addra
        .dina(mem_dina),    // input wire [1 : 0] dina
        .clkb(clk_25),    // input wire clkb
        .addrb(mem_addrb),  // input wire [18 : 0] addrb
        .doutb(mem_doutb)  // output wire [1 : 0] doutb
    );
    
    wire r1, g1, b1;
    VGAdrive vgadriver_inst (
        .clk(clk_25),
        .red(in_range ? mem_doutb[0] : 0),
        .green(in_range ? mem_doutb[1] : 0),
        .blue(0),
        .row(row),
        .column(column),
        //vga drive signals
        .Rout(r1),
        .Gout(g1),
        .Bout(b1),
        .H(H),
        .V(V)
    );

	assign R = {r1,r1,r1,r1};
	assign G = {g1,g1,g1,g1};
	assign B = {b1,b1,b1,b1};
  
endmodule