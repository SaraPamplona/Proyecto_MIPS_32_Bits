module MyIMem(
    input [31:0] address,
    output reg [31:0] data 
);

reg [7:0] memory[0:255];

initial
begin
    /*{memory[0],memory[1],memory[2],memory[3]}       = 32'b0;
    {memory[4],memory[5],memory[6],memory[7]} 		= 32'b00000000000000010010100000100000;
    {memory[8],memory[9],memory[10],memory[11]}  	= 32'b00000000001000100011000000100000;
    {memory[12],memory[13],memory[14],memory[15]}	= 32'b00000000010000010011100000100010;
    {memory[16],memory[17],memory[18],memory[19]}	= 32'b00000000001000100100000000100010;
    {memory[20],memory[21],memory[22],memory[23]}	= 32'b00000000011001000100100000100100;
    {memory[24],memory[25],memory[26],memory[27]}	= 32'b00000000100000110101000000100101;
    {memory[28],memory[29],memory[30],memory[31]}	= 32'b00000000011010100101100000100100;
    {memory[32],memory[33],memory[34],memory[35]}	= 32'b00000000111010000110000000100101;
    {memory[36],memory[37],memory[38],memory[39]}	= 32'b00000000011001000110100000101010;
    {memory[40],memory[41],memory[42],memory[43]}	= 32'b00000000001000100111000000101010;*/
    
end

always @*
begin
    data = {memory[address], memory[address + 1], memory[address + 2], memory[address + 3]};
end

endmodule
