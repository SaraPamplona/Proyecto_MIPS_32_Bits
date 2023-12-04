module Shift_Left_2(
input [31:0]SL_in,
output reg[31:0]SL_out
);

always @*
	begin
	   SL_out = SL_in << 2;
	end
endmodule 
