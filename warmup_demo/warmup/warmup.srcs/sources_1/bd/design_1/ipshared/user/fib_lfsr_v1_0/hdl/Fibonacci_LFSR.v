`timescale 1 ns / 1 ps

module Fibonacci_LFSR(LFSR, clk, resetn, init,led, LEDenable,enable);
    output reg [15:0] LFSR;
    input clk,resetn;
    input [15:0] init;
    output reg [15:0] led;
    input LEDenable;
    input enable;
    
always @(posedge clk, negedge resetn)
begin
    if  (enable)
    begin
        if(~resetn)
            LFSR <= init;//init;
        LFSR=LFSR<<1|(((LFSR[15]^LFSR[13])^LFSR[12])^LFSR[10]);
    end
end

always @(*)
begin
    if (LEDenable==1'b1)
        led = LFSR;
    else
        led = 16'b0000;
end
	
endmodule



