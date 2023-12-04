module Shift_Left_26_28(
input [25:0]SL_in,
output reg[27:0]SL_out
);

always @*
	begin
	   SL_out = SL_in << 2;
	end
endmodule 
