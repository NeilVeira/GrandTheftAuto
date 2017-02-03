`timescale 1 ps / 1 ps

module remote_controller(
    input switch,
    output [1:0] out    
);

assign out[0] = switch;
assign out[1] = switch;

endmodule