`timescale 1ns / 1ps


module Adder(ain1,
             ain2,
             add_out
    );
    input [63:0] ain1;
    input [63:0] ain2;
    output [63:0] add_out;
    assign add_out = ain1+ain2;
    
endmodule
