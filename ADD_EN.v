`timescale 1ns / 1ps

module ADD_EN(input[3:0] in1,in2,
input en,
output [4:0] out
    );
    
    reg[4:0] temp;
    assign out = temp;
    always @ (*)
    begin
        if(en)
        temp = in1+in2;
    end
endmodule
