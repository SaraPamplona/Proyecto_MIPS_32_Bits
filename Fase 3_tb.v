`timescale 1ns/1ns
module Fase3_tb();

reg clk_tb;

MyDatapath _Datapath(.clk(clk_tb));

always #100 clk_tb = ~clk_tb;

initial
begin
    clk_tb = 1'b0;

    #20000
    $stop;
end

endmodule
