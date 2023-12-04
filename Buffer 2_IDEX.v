//BUFFER 2: ID/EX
module IDEX(
input clk,
input [1:0]I_WB,
input [2:0]I_M,
input [4:0]I_EX,
input [31:0]I_Next_address,
input [31:0]I_O1,
input [31:0]I_O2,
input [31:0]I_Ext_Inmed,
input [4:0]I_RT,
input [4:0]I_RD,
input I_Jump,
input [25:0]I_Instr_J,
output reg [1:0]O_WB,
output reg [2:0]O_M,
output reg O_EX_RegDst,
output reg [2:0]O_EX_ALUOp,
output reg O_EX_ALUSrc,
output reg [31:0]O_Next_address,
output reg [31:0]O_O1,
output reg [31:0]O_O2,
output reg [31:0]O_Ext_Inmed,
output reg [4:0]O_RT,
output reg [4:0]O_RD,
output reg O_Jump,
output reg [25:0]O_Instr_J);

always @(posedge clk)
begin
	O_WB=I_WB;
	O_M=I_M;
	O_EX_RegDst=I_EX[0];
	O_EX_ALUOp=I_EX[3:1];
	O_EX_ALUSrc=I_EX[4];
	O_Next_address=I_Next_address;
	O_O1=I_O1;
	O_O2=I_O2;
	O_Ext_Inmed=I_Ext_Inmed;
	O_RT=I_RT;
	O_RD=I_RD;
	O_Jump=I_Jump;
	O_Instr_J=I_Instr_J;
end

endmodule