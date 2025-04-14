`timescale 1ns / 1ps


module read(output [3:0] out1,addo1,
input[3:0] in1,addi1,addi2,in2,
input clk,en

    );
       reg [3:0] S [0:15];

reg [3:0] temp_out1;
assign out1 = temp_out1;

always @ (negedge clk)
begin
    if(!en)
        begin
            temp_out1 <= S[addo1];
        end
     else
        begin
            S[addi1] <= in1;
            S[addi2] <= in2;
        end
        

end
endmodule
