`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2017 06:46:48 PM
// Design Name: 
// Module Name: PWM_Module
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


module PWM_Module(out, clock_rtl, resetn, FB, LR);
output [3:0] out;
input clock_rtl, resetn;
input [31:0] FB, LR;

reg [15:0] count;

always @(posedge clock_rtl, negedge resetn)
begin
    if(~resetn)
        count = 0;
    else
        count = count + 1;
end

PWM_Core Core1(FB[31:16],count,out[0]);
PWM_Core Core2(FB[15:0],count,out[1]);
PWM_Core Core3(LR[31:16],count,out[2]);
PWM_Core Core4(FB[15:0],count,out[3]);
endmodule


module PWM_Core(count,trig,out);
output out;
input [15:0] trig, count;

assign out = (count<trig);

endmodule
