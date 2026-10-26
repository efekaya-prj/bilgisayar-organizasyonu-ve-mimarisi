`timescale 1ns / 1ps

module tb_alu_4bit;

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] Alu_Sel;

    wire [3:0] Alu_Out;
    wire Carry_Borrow;

    alu_4bit uut (
        .A(A),
        .B(B),
        .Alu_Sel(Alu_Sel),
        .Alu_Out(Alu_Out),
        .Carry_Borrow(Carry_Borrow)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_alu_4bit);

        $display("-------------------------------------------------------------------------");
        $display("Zaman | Alu_Sel |      A      |      B      |   Alu_Out   | Carry/Borrow");
        $display("-------------------------------------------------------------------------");
        $monitor("%4dns |   %b    | %b (%2d)  | %b (%2d)  | %b (%2d)  |      %b", 
                 $time, Alu_Sel, A, A, B, B, Alu_Out, Alu_Out, Carry_Borrow);

        A = 4'b1001; B = 4'b0011;
        
        Alu_Sel = 2'b00; #10;
        Alu_Sel = 2'b01; #10;
        Alu_Sel = 2'b10; #10;
        Alu_Sel = 2'b11; #10;

        A = 4'b0110; B = 4'b1100;
        
        Alu_Sel = 2'b00; #10;
        Alu_Sel = 2'b01; #10;
        Alu_Sel = 2'b10; #10;
        Alu_Sel = 2'b11; #10;

        $display("-------------------------------------------------------------------------");
        $finish;
    end

endmodule