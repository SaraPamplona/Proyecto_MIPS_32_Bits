module MyALUControl(
    input [2:0] alu_operation,
    input [5:0] function_code,
    output reg [3:0] alu_select
);

always @*
begin
    case (alu_operation)
    3'b010:
    begin
        case (function_code)
            6'b100100:
                alu_select = 4'b0000; // AND
            6'b100101:
                alu_select = 4'b0001; // OR
            6'b100000:
                alu_select = 4'b0010; // ADD
            6'b100010:
                alu_select = 4'b0110; // SUBTRACT
            6'b101010:
                alu_select = 4'b0111; // SET ON LESS THAN (SLT)
            6'b000000:
                alu_select = 4'b0000; // Soporte a la operacion Nop
        endcase
    end
    3'b000:
    begin
	alu_select = 4'b0010; // ADD
    end
    3'b001:
    begin
	alu_select = 4'b0110; // SUBTRACT
    end
    3'b011:
    begin
	alu_select = 4'b0000; // AND
    end
    3'b100:
    begin
	alu_select = 4'b0001; // OR
    end
    3'b101:
    begin
	alu_select = 4'b0111; // SLT
    end

    endcase
end

endmodule
