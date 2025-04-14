`timescale 1ns / 1ps



module CLK_DIV(clk,reset,out
    );
    input clk,reset;
    output out;
    reg [1:0] temp;
    assign out = ~temp[0];
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            temp <= 2'd0;
        else
            temp <= temp + 1'd1;
    end
    
endmodule
