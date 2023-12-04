module MyALU(
    input [31:0] operand1,
    input [31:0] operand2,
    input [3:0] alu_select,
    output reg zero_flag,
    output reg [31:0] result
);

always @*
begin 
    case (alu_select)
        4'b0000:
        begin
            result = operand1 & operand2; // AND
        end

        4'b0001:
        begin
            result = operand1 | operand2; // OR
        end

        4'b0010:
        begin
            result = operand1 + operand2; //ADD
        end

        4'b0110:
        begin
            result = operand1 - operand2; //SUB
        end

        4'b0111:
        begin
            result = operand1 < operand2?1:0; // SLT
        end
        default: 
        begin
            result=32'd0;
        end
    endcase

    zero_flag = result == 0;
end

endmodule
