module rtcClkDivider (
	input sys_clk,    // 1 MHz
	output clk_500Hz, // 500 Hz
	output clk_5s  // 0.2 Hz
);
    parameter KEYCHANGE_PERIOD = 5;  // DO NOT CHANGE THE NAME OF THIS PARAMETER 
    // AND MAKE SURE TO USE THIS PARAMETER INSTEAD OF HARDCODING OTHER VALUES
    reg [15:0] reg_500;
    reg [31:0] reg_5s;

    reg state_500, state_5s;

    parameter COMP_500Hz = 1_000;
    parameter COMP_5s = KEYCHANGE_PERIOD * 500_000;

    wire [15:0] reg_500_next = reg_500 + 1;
    wire [31:0] reg_5s_next = reg_5s + 1;


    initial begin
        reg_500 = 0;
        reg_5s = 0;
        state_5s = 1'b0;
        state_500 = 1'b0;
    end

    always @(posedge sys_clk) begin

        if (reg_500_next < COMP_500Hz) begin
            reg_500 <= reg_500_next;
        end else begin
            state_500 = ~state_500;
            reg_500 <= 0; 

        end

        if (reg_5s < COMP_5s) begin
            reg_5s <= reg_5s_next;
        end else begin
            state_5s = ~state_5s;
            reg_5s <= 0;
        end

    end

    assign clk_500Hz = state_500;
    assign clk_5s = state_5s;
endmodule