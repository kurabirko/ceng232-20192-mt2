module b16toBCD (
	input [15:0] to_display,
	input enable,
	output [3:0] D5,	
	output [3:0] D4,	
	output [3:0] D3,	
	output [3:0] D2,	
	output [3:0] D1	
);

parameter NULL_VALUE = 4'b1111;

assign D1 = enable ? to_display %10 : NULL_VALUE;
assign D2 = enable ? (to_display / 10) % 10 : NULL_VALUE;
assign D3 = enable ? (to_display / 100) % 10 : NULL_VALUE;
assign D4 = enable ? (to_display / 1000) % 10 : NULL_VALUE;
assign D5 = enable ? (to_display / 10000) % 10 : NULL_VALUE;

endmodule