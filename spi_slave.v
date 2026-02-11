module spi_slave (
    input sclk,
    input ss,
    input mosi,
    output reg [7:0] data_out
);

reg [3:0] bit_cnt;
reg [7:0] shift_reg;

always @(posedge sclk) begin
    if (!ss) begin
        shift_reg <= {shift_reg[6:0], mosi};
        bit_cnt <= bit_cnt + 1;
        if (bit_cnt == 7) begin
            data_out <= shift_reg;
        end
    end
end

endmodule
