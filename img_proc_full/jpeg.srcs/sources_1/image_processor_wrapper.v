`timescale 1ns / 1ps

module image_processor_wrapper (
    input clk,
    input reset,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    output H,
    output V
    );
    
    wire clk_25, clk_100;
    clk_wiz_0 clk_wiz_inst (
        // Clock in ports
        .clk_in1(clk),     // input clk_in1
        // Clock out ports
        .clk_out1(clk_100),
        .clk_out2(clk_25)
    );    // output clk_out1
    
    wire ready;
    reg [11:0] addr;
    wire [31:0] data; 
    
    always @ (posedge clk_100) begin
        if (reset) 
            addr <= 0;
        else if (ready) begin 
            addr <= addr+1;
        end    
    end
    
    blk_mem_gen_4 data_mem (
      .clka(clk_100),    // input wire clka
      .wea(0),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [13 : 0] addra
      .dina(0),    // input wire [31 : 0] dina
      .douta(data)  // output wire [31 : 0] douta
    );
    
    image_processor image_processor_inst (
        .Clk(clk_100),
        .clk_25(clk_25),
        .data_i(data),
        .reset_i(reset),
		.eoi_o(),
		.error_o(),
		.context_o(),
		.red_o(),
		.green_o(),
		.blue_o(),
		.width_o(),
		.height_o(),
		.datavalid_o(),
        .datavalid_i(ready && addr < 2980),
        .ready_i(1),
        .ready_o(ready),
        .R(R),
        .G(G),
        .B(B),
        .H(H),
        .V(V)
    );
    
    
endmodule
