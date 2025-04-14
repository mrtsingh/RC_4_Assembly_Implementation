`timescale 1ns / 1ps

module Down_counter_2(q,
                    clk,
                    reset
    );
    output reg[1:0] q;
    input clk,reset;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset)
            q = 2'b00;
        else
            q = q-1;
    end
    
endmodule
