`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: labtest_tb
/////////////////////////////////////////////////////////////////
module Fibonacci_LFSR_tb(

    );
    
    reg clk;
    reg resetn;
    reg init;

    Fibonacci_LFSR(LFSR, clk, resetn)
    
       
    initial
    begin
        clk = 0;
        reset_b = 0;
        InputValid = 0;
        DataInput = 0;
    end  
    
    always 
        #5 clk = !clk;
    
    always begin
        #10 DataInput = DataInput+1;
    end
    
    always begin
        #30 InputValid = 1;
        #80 InputValid = 0;
    end
    
    always
        begin
        #30 reset_b = 1;
        #200 reset_b = 0;
      end
endmodule