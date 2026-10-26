module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [1:0] Alu_Sel,
    output reg [3:0] Alu_Out,
    output reg Carry_Borrow
);

    always @(*) begin
        Carry_Borrow = 1'b0;
        Alu_Out      = 4'b0000;

        case (Alu_Sel)
            2'b00: begin
                {Carry_Borrow, Alu_Out} = A + B;
            end
            
            2'b01: begin
                {Carry_Borrow, Alu_Out} = A - B;
            end
            
            2'b10: begin
                Alu_Out      = A & B;
                Carry_Borrow = 1'b0;
            end
            
            2'b11: begin
                Alu_Out      = A | B;
                Carry_Borrow = 1'b0;
            end
            
            default: begin
                Alu_Out      = 4'b0000;
                Carry_Borrow = 1'b0;
            end
        endcase
    end

endmodule