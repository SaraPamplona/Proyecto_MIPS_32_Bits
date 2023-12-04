module ADDER(
input [31:0] O1,
input [31:0] O2,
output reg [31:0] Res);

always@*
begin
	Res = O1 + O2;
end

endmodule