`timescale 1ns / 1ps

module simulate_microblaze (
    );

    reg clk_100, clk_25;
    reg resetn;
    reg [31:0] data;
    reg datavalid;
    wire ready;
    
    integer in_file, cnt;
    
    stream_jpg_yy_nv_mn_v1_0 stream_jpg_yy_nv_mn_v1_0_inst (
        .s00_axis_aclk(clk_100),
        .s00_axis_aresetn(resetn),
        .s00_axis_tready(ready),
        .s00_axis_tdata(data),
        .s00_axis_tstrb(),
        .s00_axis_tlast(),
		.s00_axis_tvalid(datavalid),
		.clk_25(clk_25),
        .calibrate(0),
        .microblaze_read(1)
    );
    
    initial begin 
        clk_100 = 0;
        clk_25 = 0;
        resetn = 0;
        datavalid = 0;
       
        in_file = $fopen("jpeg_tb.txt","r");
        
        #1000
        resetn = 1;
        cnt = $fread(in_file, data);
        while (cnt != 0) begin 
            datavalid = 1; 
            #10
            datavalid = 0;
            #100
            cnt = $fread(in_file, data);
            //wait until ready = 1
            while (!ready) begin 
                #10
                datavalid = 0;
            end
        end 
        
    end
    
    always 
        #5 clk_100 = ~clk_100;
    always 
        #20 clk_25 = ~clk_25;
        
endmodule