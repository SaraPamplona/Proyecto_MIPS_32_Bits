module MyPC(
	input clk,
	input [31:0]in,
	output reg [31:0]out);

initial
begin
	out = 32'b0;
end
	
always@(posedge clk) //Ups
begin
	out = in;
end
endmodule
