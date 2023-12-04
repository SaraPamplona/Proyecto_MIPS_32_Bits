module MyMem(
    input [31:0] address,
    input [31:0] data_write,
    input write_enable, // es como el enable
    input read_enable, // es como el enable
    output reg [31:0] data_read
);

reg [31:0] memory[0:255];

/*initial
begin
	memory[0]=32'd1;
	memory[1]=32'd2;
	memory[2]=32'd6;
	memory[30]=32'd10;
end*/


always @*
begin
    if (write_enable == 1'b1 & read_enable == 1'b0)
    begin
        memory[address] = data_write; // escribe en la direcci�n address
    end
    else if (write_enable == 1'b0 & read_enable == 1'b1)
    begin
        data_read = memory[address]; // lee la memoria en la direcci�n address
    end
end

endmodule
