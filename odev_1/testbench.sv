`timescale 1ns / 1ps

module tb_mux4to1_8bit;

    logic [7:0] d0, d1, d2, d3;
    logic [1:0] sel;
    logic [7:0] y;

    mux4to1_8bit uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mux4to1_8bit);

        $monitor("Time=%0t | sel=%b | d0=%b d1=%b d2=%b d3=%b | y=%b", 
                 $time, sel, d0, d1, d2, d3, y);

        d0 = 8'b0000_1111;
        d1 = 8'b1111_0000;
        d2 = 8'b1010_1010;
        d3 = 8'b0101_0101;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        d3 = 8'b1111_1111; #10;

        $finish;
    end

endmodule