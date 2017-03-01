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
    output reg [7:0] r,
    output reg [7:0] g,
    output reg [7:0] b,
    //reg clk;
    output reg data_valid,
    output reg rst
);
    
    integer in_file;
    integer cnt1;
    
    initial begin
        rst = 0;
        data_valid = 0;
        in_file = $fopen("tb_input.txt","r");
        
        #300 //need to wait ~300 ns for the clk_wiz clock to start
        cnt1 = $fscanf(in_file, "%d %d %d\n", r,g,b);
        while (cnt1 == 3) begin
            data_valid = 1;
            #10
            cnt1 = $fscanf(in_file, "%d %d %d\n",r,g,b);
        end
    end     
        
    always begin
        #10 rst = 1;
        #10000 rst = 0;
    end  
    
endmodule
