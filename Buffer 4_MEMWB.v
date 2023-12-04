//BUFFER 4: MEM/WB
module MEMWB(
input clk,
input [1:0]I_WB,
input [31:0]I_ReDat_Mem,
input [31:0]I_ALU_Res,
input [4:0]I_Addr_Reg_Wri,
input I_Jump,
input [31:0]I_Ins32_J,
output reg O_WB_RegWrite,
output reg O_WB_MemtoReg,
output reg [31:0]O_ReDat_Mem,
output reg [31:0]O_ALU_Res,
output reg [4:0]O_Addr_Reg_Wri,
output reg O_Jump,
output reg [31:0]O_Ins32_J);

always @(posedge clk)
begin
	O_WB_RegWrite=I_WB[0];
	O_WB_MemtoReg=I_WB[1];
	O_ReDat_Mem=I_ReDat_Mem;
	O_ALU_Res=I_ALU_Res;
	O_Addr_Reg_Wri=I_Addr_Reg_Wri;
	O_Jump=I_Jump;
	O_Ins32_J=I_Ins32_J;
end

endmodule