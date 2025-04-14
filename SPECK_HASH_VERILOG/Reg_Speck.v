`timescale 1ns / 1ps

module Reg_Speck(din,
                 dout,
                 clk,
                 reset
    );
    input[63:0] din;
    input clk,reset;
    output reg [63:0] dout;
    
    always @ (posedge clk or posedge reset)
    begin
         if (reset)
         dout=64'd0;
         else
         dout= din;
    end
        
endmodule
