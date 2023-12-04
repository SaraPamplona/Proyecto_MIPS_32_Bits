module MyADD_4(
    input [31:0] operand,
    output reg [31:0] result
);

always @*
begin 
    result = operand + 4;
end

endmodule
