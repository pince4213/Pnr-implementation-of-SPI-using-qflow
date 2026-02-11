module spi_master (
    input clk,
    input rst,
    input [7:0] data_in,
    input start,
    output reg mosi,
    output reg sclk,
    output reg ss,
    output reg done
);

reg [3:0] bit_cnt;
reg [7:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        bit_cnt <= 0;
        sclk <= 0;
        ss <= 1;
        done <= 0;
    end else begin
        if (start) begin
            ss <= 0;
            shift_reg <= data_in;
            bit_cnt <= 8;
        end
        
        if (bit_cnt > 0) begin
            sclk <= ~sclk;
            if (sclk == 0) begin
                mosi <= shift_reg[7];
                shift_reg <= shift_reg << 1;
                bit_cnt <= bit_cnt - 1;
            end
        end else begin
            ss <= 1;
            done <= 1;
        end
    end
end

endmodule
