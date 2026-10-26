`timescale 1ns / 1ps

module tb_adder_4bit;
    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    adder_4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_adder_4bit);
        

        $monitor("Zaman=%0t | A=%b (%0d), B=%b (%0d), Cin=%b -> Cout=%b, Sum=%b (%0d)", 
                  $time, A, A, B, B, Cin, Cout, Sum, {Cout, Sum});

        A = 4'b0000; B = 4'b0000; Cin = 1'b0; #10;
        A = 4'b0011; B = 4'b0101; Cin = 1'b0; #10;
        A = 4'b0111; B = 4'b1000; Cin = 1'b1; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1'b0; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #10;

        $finish;
    end
endmodule