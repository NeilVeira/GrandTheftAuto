`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2017 09:45:27 AM
// Design Name: 
// Module Name: image_processor_tb
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


module image_processor_tb(

    );
    
    reg [7:0] x;
    reg [7:0] y;
    reg [7:0] r;
    reg [7:0] g;
    reg [7:0] b;
    reg clk;
    reg data_valid;
    reg rst;
    wire colour;
    integer in_file, colour_file, edge_file;
    integer cnt1, cnt2;
    reg [7:0] expected_colour;
    
    image_processor #(
        .target_r(180),
        .target_g(45),
        .target_b(60)
    ) image_processor_inst (
        .x(x),
        .y(y),
        .r(r),
        .g(g),
        .b(b),
        .clk(clk),
        .data_valid(data_valid),
        .rst(rst),
        .colour(colour)
    );
    
    initial begin
        clk = 0;
        rst = 0;
        data_valid = 0;
        in_file = $fopen("tb_input.txt","r");
        colour_file = $fopen("tb_colour.txt","r");
        edge_file = $fopen("tb_edges.txt","r");
        
        cnt1 = $fscanf(in_file, "%d %d %d %d %d\n", x,y,r,g,b);
        cnt2 = $fscanf(colour_file, "%d\n", expected_colour);
        while (cnt1 == 5) begin
            data_valid = 1;
            #10
            if (colour != expected_colour)
                $display("colour incorrect at",$time);
            
             cnt1 = $fscanf(in_file, "%d %d %d %d %d\n", x,y,r,g,b);
             cnt2 = $fscanf(colour_file, "%d\n", expected_colour);
        end
    end     
        
    always
        #5 clk = !clk;
        
    always begin
        #20 rst = 1;
        #1000 rst = 0;
    end        
    
    
endmodule
