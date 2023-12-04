module MyDatapathMux_5B(
    input control_signal,
    input [4:0] input_data_1, //0
    input [4:0] input_data_2, //1
    output reg [4:0] output_data
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
