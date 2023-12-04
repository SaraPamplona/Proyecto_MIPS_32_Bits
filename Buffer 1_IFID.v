//BUFFER 1: IF/ID
module IFID(
input clk,
input [31:0]Next_address,
input [31:0]Instruction,
output reg [31:0]O_Next_address,
output reg [31:0]O_Instruction);

always @(posedge clk)
begin
	O_Next_address = Next_address;
        O_Instruction = Instruction;
end

endmodule