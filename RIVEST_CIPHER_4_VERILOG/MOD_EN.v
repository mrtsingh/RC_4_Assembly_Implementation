`timescale 1ns / 1ps


module MOD_EN(input [4:0] in,
    output [3:0] out,
    input en
    );
    reg [3:0] temp;
    assign out = temp;
    always @ (*)
    begin
        if(en)
            temp = in % 16;
    end
endmodule
