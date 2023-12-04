module sign_extend(
input [15:0] Data_in,
output reg [31:0] Data_out);

always @*
begin
	if(Data_in[15])
	begin
        Data_out={16'b1111111111111111,Data_in};	
	end
	else
	begin
	Data_out={16'b0000000000000000,Data_in}; 
	end
end
	
endmodule