`timescale 1ns / 1ps



module Up_counter(q,
reset,clk
    );
    output [3:0] q;
    input clk,reset;
    reg[3:0] temp_q;
    assign q=temp_q;
    always @(posedge clk, posedge reset)
    begin
        if(reset)
              temp_q <= 4'b0000;
        else if(temp_q < 4'b1110)
              temp_q <= q+2;
        else
                temp_q <= 4'b0000;
    end
endmodule
