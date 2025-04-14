`timescale 1ns / 1ps


module Shift_right(in,
                   out
    );
    input[63:0] in;
    output[63:0] out;
    assign out = (in>>7);
    
endmodule
