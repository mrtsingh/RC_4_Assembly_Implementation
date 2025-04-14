`timescale 1ns / 1ps


module Reg_rc(din,
dout,clk,reset
    );
    input [3:0] din;
    output reg[3:0] dout;
    input clk,reset;
    
    always @ (negedge clk or posedge reset)
     begin
         if (reset)
          dout<=4'b0000;
         else
         dout<= din;
    end
    
endmodule
