`timescale 1ns/1ps

module spi_tb;

reg clk = 0;
reg rst;
reg start;
reg [7:0] data_in;
wire [7:0] data_out;

spi_top uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    rst = 1;
    start = 0;
    data_in = 8'hA5;
    #20;
    rst = 0;
    #10;
    start = 1;
    #200;
    $finish;
end

endmodule
