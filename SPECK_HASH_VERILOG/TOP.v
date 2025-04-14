`timescale 1ns / 1ps

module TOP( X,
                    reset8,
                    reset4,
                    reset_reg,
                    clk,
                    H1,
                    K1,
                    Y1,
                    hout,
                    ld,ld1
    );
    input [63:0] X,H1,K1,Y1;
    input clk,reset8,reset4,reset_reg;
   // output[31:0] Hout;
    output [63:0] hout;
    input ld,ld1;
    wire [63:0] X_out,Y_out,H_final;
    wire[63:0] H;
    wire[63:0] mtoxw,mtoyw,mtohw;
    wire[63:0] w1,w2,w3,w4,w5,w7,w10,w11;
    wire[63:0] w21,w22,w23,w24,w25,w26,w27,w28,w29,ww;
    wire[63:0] w6,w8;
    wire[2:0] w13;
    wire[1:0] w33;
    
    mux2to1 m1(.in1(X),.in2(w6),.ld(ld),.out(mtoxw));
    mux2to1 m2(.in1(Y1),.in2(w8),.ld(ld),.out(mtoyw));
   
    Reg_Speck   regx  (.din(mtoxw),.dout(w1),.clk(clk),.reset(reset_reg));
    Reg_Speck   regy  (.din(mtoyw),.dout(w2),.clk(clk),.reset(reset_reg));
    Reg_Speck   regk1 (.din(K1),.dout(w5),.clk(clk),.reset(reset_reg));
    Shift_right sr  (.in(w1),.out(w3));
    Adder add       (.ain1(w3),.ain2(w2),.add_out(w4));
    assign w6 = w4^w5;
//    Reg_Speck regx1  (.din(w6),.dout(w1),.clk(clk),.reset(reset));
    
    Shift_left sl   (.in(w2),.out(w7));
    assign w8 = w6^w7;
//    Reg_Speck regy1 (.din(w8),.dout(w2),.clk(clk),.reset(reset));
    
    Down_counter dc (.q(w13),.clk(clk),.reset(reset8));   
    
    Buffer bf1      (.in1(w6),.out(w10),.ld(|w13),.reset(reset_reg),.clk(clk));
    Buffer bf2      (.in1(w8),.out(w11),.ld(|w13),.reset(reset_reg),.clk(clk));
    
    Reg_Speck finalx (.din(w10),.dout(X_out),.clk(clk),.reset(reset_reg));
    Reg_Speck finaly (.din(w11),.dout(Y_out),.clk(clk),.reset(reset_reg));
    
//    assign H = X_out ^ Y_out;
      assign H = w10 ^ w11;
      assign H_final = H^H1;
   // Reg_Speck regH (.din(H_final),.dout(Hout),.clk(clk),.reset(reset_reg));
    
    mux2to1 mh          (.in1(H_final),.in2(ww),.ld(ld1),.out(w21));
    Shift_right sr1     (.in(w21),.out(w23));
    Shift_left  sl1     (.in(w21),.out(w25));
//    
    Adder     add1      (.ain1(w23),.ain2(w5),.add_out(w24));
    assign w26  = w24 ^ w25;
    Reg_Speck   addh    (.din(w26),.dout(ww),.clk(clk),.reset(reset_reg));
    
     Down_counter_2 dch (.q(w33),.clk(clk),.reset(reset4));
     Buffer bf1h      (.in1(ww),.out(w28),.ld(|w33),.reset(reset_reg),.clk(clk));
     Reg_Speck finalh (.din(w28),.dout(hout),.clk(clk),.reset(reset_reg));
    
endmodule
