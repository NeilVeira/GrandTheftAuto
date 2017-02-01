`timescale 1ns / 1ps
module warmup_demo_tb();

reg clk;
reg reset;
reg [15:0] led;

design_1_wrapper warmup_demo
   (.clock_rtl(clk),  // system clock
    .reset_rtl_0(reset),    // active high
    .reset_rtl_0_1(~reset), // active low
    .led(led)
    );                // sum output


initial
begin
    clk = 1'b0;
    reset = 1'b1;
    #45
    reset = 1'b0;
end


always 
  #5 clk = ~clk;

endmodule
