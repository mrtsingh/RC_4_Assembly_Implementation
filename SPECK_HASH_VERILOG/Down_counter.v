`timescale 1ns / 1ps

module Down_counter(q,
                    clk,
                    reset
    );
    output reg[2:0] q;
    input clk,reset;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset)
            q = 3'b000;
        else
            q = q-1;
    end
    
endmodule
