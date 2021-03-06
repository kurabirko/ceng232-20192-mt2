`timescale 1ns / 1ps

module timekeeper_tb;

reg clk;
wire [15:0] cur_time; 
localparam period = 2;
integer i, limit, file;

timekeeper UUT(
    .clk(clk),
    .cur_time(cur_time)
);

always @(clk) begin
    $fdisplay(file, "Time %0t clk %0d output %0d", $time, clk, cur_time);
end

initial clk=0;
always #period clk=~clk;

initial 
begin
    limit = 2**18;
    $dumpfile("DUMPFILE");
    $dumpvars(0, timekeeper_tb);
    $timeformat(-9, 0, " ns", 20);
    file = $fopen("LOGFILE","a");
    #(period/2)
    for (i = 0; i<limit; i=i+1) #period;
    $fclose(file);
    $display("Check LOGFILE for log and DUMPFILE for vcd file",);
    $finish;
end

endmodule