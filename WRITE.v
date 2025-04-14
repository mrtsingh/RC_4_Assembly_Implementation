`timescale 1ns / 1ps


module WRITE(input [3:0] addi,in,
             input clk
    );
    
    reg [3:0] memory [0:15];
    
    always @ (posedge clk)
    begin
                memory[addi] <= in;
         
    end
    
endmodule
