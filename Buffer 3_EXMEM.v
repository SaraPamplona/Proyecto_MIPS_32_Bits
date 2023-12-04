//BUFFER 3: EX/MEM
module EXMEM(
input clk,
input [1:0]I_WB,
input [2:0]I_M,
input [31:0]I_ADD_Res,
input I_ZF,
input [31:0]I_ALU_Res,
input [31:0]I_DatWri_Mem,
input [4:0]I_Addr_Reg_Wri,
input I_Jump,
input [31:0]I_Ins32_J,
output reg [1:0]O_WB,
output reg O_M_Branch,
output reg O_M_MemRead,
output reg O_M_MemWrite,
output reg [31:0]O_ADD_Res,
output reg O_ZF,
output reg [31:0]O_ALU_Res,
output reg [31:0]O_DatWri_Mem,
output reg [4:0]O_Addr_Reg_Wri,
output reg O_Jump,
output reg [31:0]O_Ins32_J);

always @(posedge clk)
begin
	O_WB=I_WB;
	O_M_Branch=I_M[0];
	O_M_MemRead=I_M[1];
	O_M_MemWrite=I_M[2];
	O_ADD_Res=I_ADD_Res;
	O_ZF=I_ZF;
	O_ALU_Res=I_ALU_Res;
	O_DatWri_Mem=I_DatWri_Mem;
	O_Addr_Reg_Wri=I_Addr_Reg_Wri;
	O_Jump=I_Jump;
	O_Ins32_J=I_Ins32_J;
end

endmodule