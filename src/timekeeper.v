module timekeeper (
	input clk,    // Clock
	output[15:0] cur_time	
);
    reg [15:0] out;
    wire [15:0] out_next;
    
    initial out =  0;
    assign out_next = (out == 16'b1111111111111111) ? 0 : out + 1;
    always @(posedge clk) out <= out_next;
    assign cur_time = out;
endmodule