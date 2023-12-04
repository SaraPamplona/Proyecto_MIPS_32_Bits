module MyBR(
    input [4:0] address_reg1,
    input [4:0] address_reg2,
    input [4:0] address_write,
    input [31:0] data_write,
    input enable, //Habilitar la escritura
    output reg [31:0] data_read1,
    output reg [31:0] data_read2,
    input clk
);

reg [31:0] memory[0:31];

/*initial
begin
    memory[0] = 32'd0; 
    memory[1] = 32'd100; 
    memory[2] = 32'd120; 
    memory[3] = 32'b10101; 
    memory[4] = 32'b01010;
    memory[31] = 32'd6;  
end*/

always @*
begin
    data_read1 = memory[address_reg1]; // lee la memoria en la direcci�n address
    data_read2 = memory[address_reg2];
end

always @(posedge clk)
begin
    if (enable && data_write !== 32'bx)
    begin
        memory[address_write] = data_write; // escribe en la direcci�n address
    end
end

endmodule
