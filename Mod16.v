`timescale 1ns / 1ps


module Mod16(input  [4:0] in,
              output [3:0] out
    );
    
    assign out = (in % 16);
    
endmodule
