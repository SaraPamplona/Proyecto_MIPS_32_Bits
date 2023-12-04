module MyDatapathMux(
    input control_signal,
    input [31:0] input_data_1, //0
    input [31:0] input_data_2, //1
    output reg [31:0] output_data
);

always @*
begin
    if(control_signal)
    begin
        output_data = input_data_2;
    end
    else
    begin
        output_data = input_data_1;
    end
end

endmodule
