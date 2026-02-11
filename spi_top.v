module spi_top (
    input clk,
    input rst,
    input start,
    input [7:0] data_in,
    output [7:0] data_out
);

wire mosi, sclk, ss;

spi_master master (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .start(start),
    .mosi(mosi),
    .sclk(sclk),
    .ss(ss)
);

spi_slave slave (
    .sclk(sclk),
    .ss(ss),
    .mosi(mosi),
    .data_out(data_out)
);

endmodule
