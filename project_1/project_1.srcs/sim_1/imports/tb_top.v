`timescale 1ns / 1ps

module tb_top();

    reg sys_clk;
    reg reset;

    design_1_wrapper design_1_wrapper_inst(
     .B(),
     .DDR2_addr(),
     .DDR2_ba(),
     .DDR2_cas_n(),
     .DDR2_ck_n(),
     .DDR2_ck_p(),
     .DDR2_cke(),
     .DDR2_cs_n(),
     .DDR2_dm(),
     .DDR2_dq(),
     .DDR2_dqs_n(),
     .DDR2_dqs_p(),
     .DDR2_odt(),
     .DDR2_ras_n(),
     .DDR2_we_n(),
     .G(),
     .H(),
     .R(),
     .V(),
     .jb_0_pin10_io(),
     .jb_0_pin1_io(),
     .jb_0_pin2_io(),
     .jb_0_pin3_io(),
     .jb_0_pin4_io(),
     .jb_0_pin7_io(),
     .jb_0_pin8_io(),
     .jb_0_pin9_io(),
     .reset(reset),
     .sys_clock(sys_clk),
     .usb_uart_rxd(),
     .usb_uart_txd());

    
    always 
        #5 sys_clk = ~sys_clk;
        
    initial 
    begin
        sys_clk = 1'b0;
        reset = 1'b1;
        #100
        reset = 1'b0;
    end

endmodule
