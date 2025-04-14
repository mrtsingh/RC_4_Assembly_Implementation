`timescale 1ns / 1ps


module mux2to1(in1,
               in2,
               ld,
               out
    );
    
    input[63:0] in1,in2;
    input ld;
    output reg [63:0] out;
    always@(*)
    begin
    if(!ld)
        out = in1;
    else
        out = in2;
    end
endmodule
