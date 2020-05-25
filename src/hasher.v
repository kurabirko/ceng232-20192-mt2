module hasher (
	input clk,    // Clock
	input [15:0] cur_time,
	input [15:0] student_id,
	output [15:0] cur_hash	
);

wire [31:0] next_hash;
reg [15:0] curr_hash;
parameter UINT16_MAX = 16'b1111111111111111;
assign cur_hash = curr_hash;

initial curr_hash = 0;
assign next_hash = (((((cur_time ^ student_id) - cur_hash)**2)>> 8) & UINT16_MAX);
always @(posedge clk) curr_hash <= next_hash;

endmodule