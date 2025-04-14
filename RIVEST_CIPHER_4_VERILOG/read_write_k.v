`timescale 1ns / 1ps


module read_write_k(output [3:0] out1,addo1,
input[3:0] in1,addi1,
input clk,en
    );
    
    reg [3:0] K [0:15];
    reg [3:0] temp_out1;
assign out1 = temp_out1;

always @ (negedge clk)
    begin
        if(!en)
            temp_out1 <= K[addo1];
        else 
            K[addi1] <= in1;
    end

endmodule
