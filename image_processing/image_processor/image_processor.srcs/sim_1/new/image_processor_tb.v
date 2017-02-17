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
    
    //ports for image_processor
    reg [7:0] x;
    reg [7:0] y;
    reg [7:0] r;
    reg [7:0] g;
    reg [7:0] b;
    reg clk;
    reg data_valid;
    reg rst;
    wire colour;
    //fifo
    wire full;
    wire empty;
    reg rd_en;
    wire [15:0] dout;
    
    integer in_file, colour_file, edge_file;
    integer cnt1, cnt2, cnt3;
    reg [7:0] expected_colour;
    reg [7:0] expected_edge_y;
    reg [7:0] expected_edge_x;
    
    image_processor #(
        .target_r(180),
        .target_g(45),
        .target_b(60),
        .loss_threshold(3500)
    ) image_processor_inst (
        .x(x),
        .y(y),
        .r(r),
        .g(g),
        .b(b),
        .clk(clk),
        .data_valid(data_valid),
        .rst(rst),
        .colour(colour),
        .full(full),
        .empty(empty),
        .rd_en(rd_en),
        .dout(dout)
    );
    
    initial begin
        rd_en = 0;
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
        #10000 rst = 0;
    end        
    
    //deal with the fifo outputs
    reg [7:0] edge_x;
    reg [7:0] edge_y;
    always begin
        //try to do a read periodically
        #40
        if (full)
            $display("Error! Fifo full at",$time);
        if (!empty) begin
            //set rd_en high for 1 clock cycle
            rd_en <= 1;
            #10
            rd_en <= 0;
            edge_y <= dout[15:8];
            edge_x <= dout[7:0];
            cnt3 = $fscanf(edge_file, "%d %d\n", expected_edge_x, expected_edge_y);
            if (edge_y != expected_edge_y || edge_x != expected_edge_x) begin
                $display("Incorrect edge pixel at",$time);
            end
        end
    end
    
endmodule
