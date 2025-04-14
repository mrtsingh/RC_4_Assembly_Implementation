`timescale 1ns / 1ps

module Buffer(in1,
              out,
              clk,
              ld,
              reset
    );
    input [63:0] in1;
    input ld;
    input clk,reset;
    output [63:0] out;
    reg [63:0] m2r;
    always@(*)
    begin
    if(!ld)
        m2r = in1;
    
    end
    
//    Reg_Speck rs (.din(m2r),.dout(out),.clk(clk),.reset(reset));
    assign out = m2r;    
endmodule
