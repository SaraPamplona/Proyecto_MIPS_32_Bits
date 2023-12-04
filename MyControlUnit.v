module MyControlUnit(
    input [31:26] opcode,
    output reg reg_Dst,
    output reg branch,
    output reg memory_read,
    output reg memory_register,
    output reg [2:0] alu_operation,
    output reg memory_write,
    output reg ALU_Src,
    output reg reg_write, 
    output reg jump   
);

always @*
begin
    case (opcode)
        6'b000000://Instrucciones Tipo R
        begin 
            reg_Dst=1'b1;
            branch=1'b0;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b010;
	    memory_write = 1'b0;
            ALU_Src=1'b0;
            reg_write = 1'b1;
	    jump=1'b0;
        end
        6'b001000://ADDI
        begin 
            reg_Dst=1'b0;
            branch=1'b0;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b000;
	    memory_write = 1'b0;
            ALU_Src=1'b1;
            reg_write = 1'b1;
	    jump=1'b0;
        end
        6'b001100://ANDI
        begin 
            reg_Dst=1'b0;
            branch=1'b0;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b011;//¿Cómo hay que ponerlo?
	    memory_write = 1'b0;
            ALU_Src=1'b1;
            reg_write = 1'b1;
	    jump=1'b0;
        end
        6'b001101://ORI
        begin 
            reg_Dst=1'b0;
            branch=1'b0;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b100;//¿Cómo hay que ponerlo?
	    memory_write = 1'b0;
            ALU_Src=1'b1;
            reg_write = 1'b1;
            jump=1'b0;
        end
        /*6'b000000://SUBI??
        begin 
            reg_Dst=1'b0;
            branch=1'b0;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b001;
	    memory_write = 1'b0;
            ALU_Src=1'b1;
            reg_write = 1'b1;
            jump=1'b0;
        end*/
        6'b100011://LW
        begin 
            reg_Dst=1'b0;
            branch=1'b0;
            memory_read = 1'b1;
            memory_register = 1'b1;
            alu_operation = 3'b000;
	    memory_write = 1'b0;
            ALU_Src=1'b1;
            reg_write = 1'b1;
            jump=1'b0;
        end
        6'b101011://SW
        begin 
            reg_Dst=1'b0;
            branch=1'b0;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b000;
	    memory_write = 1'b1;
            ALU_Src=1'b1;
            reg_write = 1'b0;
            jump=1'b0;
        end
        6'b001010://SLTI
        begin 
            reg_Dst=1'b0;
            branch=1'b0;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b101;//¿Cómo hay que ponerlo?
	    memory_write = 1'b0;
            ALU_Src=1'b1;
            reg_write = 1'b1;
            jump=1'b0;
        end
        6'b000100://BEQ
        begin 
            reg_Dst=1'b0;
            branch=1'b1;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b001;//¿Está bien?
	    memory_write = 1'b0;
            ALU_Src=1'b0;
            reg_write = 1'b0;
            jump=1'b0;
        end
        /*6'b000101://BNE
        begin 
            reg_Dst=1'b0;
            branch=1'b1;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b001;//¿Cómo implementar esta operación?
	    memory_write = 1'b0;
            ALU_Src=1'b0;
            reg_write = 1'b0;
            jump=1'b0;
        end
        6'b000111://BGTZ
        begin 
            reg_Dst=1'b0;
            branch=1'b1;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b101; //Esta operación falla cuando se elige un 0, porque 0>0 es falso y la manera en que implementó con SLT hace que se ejecuté el branch
	    memory_write = 1'b0;
            ALU_Src=1'b0;
            reg_write = 1'b0;
            jump=1'b0;
        end*/
        6'b000010://Instrucción J
	begin
            reg_Dst=1'b0;
            branch=1'b0;
            memory_read = 1'b0;
            memory_register = 1'b0;
            alu_operation = 3'b000;//MODIFICAR
	    memory_write = 1'b0;
            ALU_Src=1'b0;
            reg_write = 1'b0;
	    jump=1'b1;
	end
    endcase
end

endmodule
