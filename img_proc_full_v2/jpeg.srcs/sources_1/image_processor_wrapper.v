`timescale 1ns / 1ps

module image_processor_wrapper (
    input clk,
    input reset,
    input calibrate,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    output H,
    output V
    );
    
    parameter MAX_ADDR = 8374;
    
    (* dont_touch = "true" *) reg [1:0] microblaze_read;
    (* dont_touch = "true" *) wire [1:0] img_proc_write;
    (* dont_touch = "true" *) wire [12:0] edge_ram_addr;
    (* dont_touch = "true" *) wire [19:0] edge_ram_din;
    (* dont_touch = "true" *) wire edge_ram_wren;
    always @(posedge clk_100) 
        microblaze_read <= 1;
    
    wire clk_25, clk_100;
    clk_wiz_0 clk_wiz_inst (
        // Clock in ports
        .clk_in1(clk),     // input clk_in1
        // Clock out ports
        .clk_out1(clk_100),
        .clk_out2(clk_25)
    );    // output clk_out1
    
    wire ready;
    reg [13:0] addr;
    reg [13:0] first_unseen_addr;
    wire [31:0] data; 
    
    always @ (posedge clk_100) begin
        if (reset) 
            addr <= 0;
        else if (ready) begin 
            if (addr == MAX_ADDR) 
                addr <= 0;
            else 
                addr <= addr+1;
        end else begin
            addr <= first_unseen_addr;
        end 
    end
    
    always @(negedge ready) begin 
        first_unseen_addr <= addr-2;
    end 
    
    reg datavalid_i;
    reg datavalid_i_reg;
    always @(posedge clk_100) begin 
        datavalid_i <= ready && addr < MAX_ADDR;
        datavalid_i_reg <= datavalid_i;
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
        .datavalid_i(datavalid_i_reg && ready),
        .ready_i(1),
        .ready_o(ready),
        .calibrate(calibrate),
        .R(R),
        .G(G),
        .B(B),
        .H(H),
        .V(V),
        .microblaze_read(microblaze_read),
        .img_proc_write(img_proc_write),
        .edge_ram_addr(edge_ram_addr),
        .edge_ram_din(edge_ram_din),
        .edge_ram_wren(edge_ram_wren)
    );
    
    
endmodule
