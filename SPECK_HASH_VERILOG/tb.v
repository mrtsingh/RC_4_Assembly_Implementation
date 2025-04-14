`timescale 1ns / 1ps

module tb();

reg [63:0]  X, H1,K1,Y1;
reg clk,reset8,reset4,reset_reg,Load,ld1;
wire [63:0] h_out;
wire [63:0] m1,m2,w1,w2,w3,w4,w5,w6,w7,w8,output_buf1,output_buf2,t,m3,w26;
wire [2:0] w13;
wire [1:0] w33;

   TOP uut(.X(X),.reset8(reset8),.reset4(reset4),.reset_reg(reset_reg),.clk(clk),.H1(H1),.K1(K1),.Y1(Y1),.ld(Load),.hout(h_out),.ld1(ld1));
   
   initial
   begin
    clk=1'b1;
    forever #5 clk = ~clk;
   end 
    initial
   begin
   #1reset_reg = 1'b1;
   #10 reset_reg = 1'b0;
   end
   initial
   begin
   #1reset8 = 1'b1;
   #10 reset8 = 1'b0;
   //#81 reset8=1'b1;
   end
   
   initial begin
   #1Load = 1'b0;
   #20 Load = 1'b1;
   end
   
   
      initial
   begin
   #1reset4 =1'b1;
   #10 reset4=   1'b0;
   //#40 reset4=1'b1;
   end
   initial begin
   ld1 = 1'b0;
   #103 ld1 = 1'b1;
 
   end
   
   initial
   begin
   X    =   64'h123456789ABCDEF1;
   H1   =   64'h6A09E66712345678;
   K1   =   64'hBB67AE8523456789;
   Y1   =   64'h6A09E66734567891;
   end
  
   
   assign m1= uut.m1.out;
   assign m2= uut.m2.out;
   assign w1= uut.regx.dout;
   assign w2= uut.regy.dout;
   assign w3= uut.sr.out;
   assign w4= uut.add.add_out;
   assign w5= uut.regk1.dout;
   assign w6= uut.w6;
   assign w7= uut.sl.out;
   assign w8= uut.w8;
   assign w13= uut.dc.q;
   assign output_buf1 = uut.bf1.out;
   assign output_buf2 = uut.bf2.out;
   assign w33 = uut.dch.q;
   assign t = uut.H_final;
   assign m3 = uut.mh.out;
   assign w26 = uut.ww;
initial begin
#1000;
$finish;
end
 
endmodule
