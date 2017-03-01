`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2017 09:39:38 PM
// Design Name: 
// Module Name: tb_top
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


module tb_top(

    );

    reg clock_rtl;
    reg reset;
    reg uart_rtl_rxd;
    wire uart_rtl_txd;

    img_proc_mb_wrapper img_proc_mb_inst
    (
        .clock_rtl(clock_rtl),
        .reset_rtl(reset),
        .reset_rtl_0(~reset),
        .uart_rtl_rxd(uart_rtl_rxd),
        .uart_rtl_txd(uart_rtl_txd)
    );
    
    always 
        #5 clock_rtl = ~clock_rtl;
        
    initial 
    begin
        clock_rtl = 1'b0;
        reset = 1'b1;
        uart_rtl_rxd = 1'b0;
        #40
        reset = 1'b0;
    end

endmodule
