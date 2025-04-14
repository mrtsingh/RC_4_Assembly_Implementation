`timescale 1ns / 1ps

module MUX2to1(in1,in2,out,sel

    );
    input[3:0] in1,in2;
    input sel;
    output reg [3:0] out;
    always@(*)
    begin
    if(sel)
        out = in1;
    else
        out = in2;
    end
endmodule
