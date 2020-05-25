module buttonFsm (
	input clk,
	input button,    
	output stateful_button
);
    parameter S0 = 1'b0, S1 = 1'b1;
    reg out, state;
    wire out_neg = out ? 0 : 1;

    initial begin
        state = S0;
        out = S0;
    end

    always @(posedge clk) begin 
        if (button) state <= S1;
        else state <= S0;
    end  

    always @(state or button) begin
        if (button == 1 && state == S0) out <= out_neg;
    end

    assign stateful_button = out;
endmodule
