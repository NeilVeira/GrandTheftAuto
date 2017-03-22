
`timescale 1 ns / 1 ps

	module stream_jpg_yy_nv_mn_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		input wire slow_clock,
		(*mark_debug = "true"*) output wire  s00_axis_tready,
		(*mark_debug = "true"*)input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,reset_yy,
		(*mark_debug = "true"*)input wire  s00_axis_tvalid,
		input wire clk_25,
		output [3:0] R,
		output [3:0] G,
		output [3:0] B,
		output H,
		output V,
        input calibrate,
        input [1:0] microblaze_read,
        output [1:0] img_proc_write,
        output [12:0] edge_ram_addr,
        output [19:0] edge_ram_din,
        output edge_ram_wren,
        output error_o
	);
// Instantiation of Axi Bus Interface S00_AXIS
	/*stream_jpg_yy_nv_mn_v1_0_S00_AXIS # ( 
		.C_S_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)
	) stream_jpg_yy_nv_mn_v1_0_S00_AXIS_inst (
		.S_AXIS_ACLK(s00_axis_aclk),
		.S_AXIS_ARESETN(s00_axis_aresetn),
		.S_AXIS_TREADY(s00_axis_tready),
		.S_AXIS_TDATA(s00_axis_tdata),
		.S_AXIS_TSTRB(s00_axis_tstrb),
		.S_AXIS_TLAST(s00_axis_tlast),
		.S_AXIS_TVALID(s00_axis_tvalid)
	);*/
    
    //This is a hack because the jpeg decoder screws up when given data with large 
    //gaps of datavalid_i=0 between words. This fifo buffers the data until we have 
    //a lot piled up and then sends it all in consecutive cycles.  
    
    (*mark_debug = "true"*)(* dont_touch = "true" *) wire rd_en;
    (*mark_debug = "true"*)(* dont_touch = "true" *) wire [31:0] dout;
    (*mark_debug = "true"*)(* dont_touch = "true" *) wire full, almost_full, empty;
    (*mark_debug = "true"*)(* dont_touch = "true" *) wire ready;    
    (*mark_debug = "true"*)(* dont_touch = "true" *) wire datavalid_i;  
    
    fifo_generator_0 image_data (
        .wr_clk(s00_axis_aclk),                  // input wire clk
        .rst(reset_yy),                // input wire srst
        .rd_clk(slow_clock),
        .din(s00_axis_tdata),                  // input wire [31 : 0] din
        .wr_en(s00_axis_tvalid),              // input wire wr_en
        .rd_en(rd_en),              // input wire rd_en
        .dout(dout),                // output wire [31 : 0] dout
        .full(full),                // output wire full
        .almost_full(almost_full),  // output wire almost_full
        .empty(empty)              // output wire empty
    );
    
    parameter WAITING_FOR_DATA=0, SENDING_DATA=1, WAITING_FOR_READY=2;
    (*mark_debug = "true"*) reg [1:0] state, next_state;
    always @(posedge s00_axis_aclk) begin 
        case (state) 
        WAITING_FOR_DATA:
            if (almost_full) 
                next_state = WAITING_FOR_READY;
            else 
                next_state = WAITING_FOR_DATA;
        SENDING_DATA:
            if (~ready || empty) 
                next_state = WAITING_FOR_DATA;
            else 
                next_state = SENDING_DATA;
        WAITING_FOR_READY:
            if (ready) 
                next_state = SENDING_DATA;
            else 
                next_state = WAITING_FOR_READY;
        endcase
        state <= next_state;
    end 
    
    assign rd_en = (state == SENDING_DATA) && ~empty;
    assign s00_axis_tready = ~full & s00_axis_tvalid;
	assign datavalid_i = rd_en & ready;
	
    image_processor img_proc_inst(
        .Clk(slow_clock),
        .clk_25(clk_25),
        .data_i(dout),
        .reset_i(reset_yy),
        .datavalid_i(datavalid_i),
        .ready_i(1'b1),
        .ready_o(ready), 
        .calibrate(calibrate), 
        .error_o(error_o),
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

	// Add user logic here

	// User logic ends

	endmodule
