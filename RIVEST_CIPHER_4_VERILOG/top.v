`timescale 1ns/1ps

module top(input en_s,clk_rst,en_k,reset1,reset2,reset3,clk,enc,reset4,en_mod,reset_reg,reset_counter_final,
           input[3:0] in1s,in2s,in_k
    );
    
    wire[3:0] wt,c1,c2,c3,s1,k1,m1,j,mux_out,temp_si,temp_sj,swapped_si,swapped_sj,ss1,c22,c33,ss2,ss3;
    wire[4:0] a1,a2;
    wire [3:0] i,wj,wmi,wri,wmj,wh,wi,wl,cf1;
    wire sel,clk_double;
    CLK_DIV cd (.clk(clk),.out(clk_double),.reset(clk_rst));
    assign sel = ~clk_double;
    
    UP_Counter_2 uc(.q(c1),.reset(reset1),.clk(clk_double));
    Up_counter uc1 (.q(c2),.reset(reset2),.clk(clk_double));
    assign c3 = c2+1;
    read S_array (.clk(clk_double),.en(en_s),.addi2(c3),.addi1(c2),.in1(in1s),.in2(in2s),.out1(s1),.addo1(c1));
    read_write_k K_array (.clk(clk_double),.en(en_k),.addi1(c1),.in1(in_k),.addo1(c1),.out1(k1));
    Adder add1  (.in1(s1),.in2(k1),.out(a1));
    Reg_rc r(.din(m1),.dout(j),.clk(clk_double),.reset(reset3));
    Adder add2 (.in1(a1),.in2(j),.out(a2));
    Mod16 m (.in(a2),.out(m1));
    Reg_rc r1 (.din(s1),.dout(temp_si),.clk(clk_double),.reset(reset3));
    read S_array_2 (.clk(clk_double),.en(en_s),.addi2(c3),.addi1(c2),.in1(in1s),.in2(in2s),.out1(temp_sj),.addo1(m1));
    Swap sw (.clk(clk),.reset(reset1),.out1(swapped_sj),.out2(swapped_si),.in1(temp_si),.in2(temp_sj),.sel(sel));
  
    Up_counter uc2 (.q(c22),.reset(reset4),.clk(clk_double));
    assign c33 = c22+1;
    
    
    
        wire [4:0] wai,waj,wij;
        integer one = 1;
        UP_Counter_2 uc3 (.q(i),.clk(clk_double),.reset(reset1));
        Adder add3 (.in1(i),.in2(one),.out(wai));
        MOD_EN m2 (.in(wai),.out(wmi),.en(en_mod));
        copy a (.clk(clk_double),.en(enc),.addi2(c33),.addi1(c22),.in1(swapped_sj),.in2(swapped_si),.out1(ss1),.addo1(wmi));
        Adder add4 (.in1(wj),.in2(ss1),.out(waj));
        Mod16 m3 (.in(waj),.out(wmj));
        Reg_rc rc1 (.din(wmj),.dout(wj),.clk(clk_double),.reset(reset_reg));
        copy wjk  (.clk(clk_double),.en(enc),.addi2(c33),.addi1(c22),.in1(swapped_sj),.in2(swapped_si),.out1(ss2),.addo1(wj));
        Adder addd (.in1(ss1),.in2(ss2),.out(wij));
        Mod16 m4 (.in(wij),.out(wt));
        copy final (.clk(clk_double),.en(enc),.addi2(c33),.addi1(c22),.in1(swapped_sj),.in2(swapped_si),.out1(ss3),.addo1(wt));
        UP_Counter_2 ucc3 (.q(cf1),.clk(clk_double),.reset(reset_counter_final));
        WRITE wrt (.clk(clk_double),.addi(cf1),.in(ss3));
        
        
//        read_s rs1(.addo1(wh),.clk(clk_half),.out1(wi));
//        Adder add5 (.in1(we),.in2(wi),.out(wk));
//        Mod16 m4 (.in(wk),.out(wj));
//        read_s rs2 (.clk(clk_half),.out1(wl),.addo1(wj));
//        write_block_final wb2 (.addi(wj),.in(wl),.clk(clk_half));
                                        
    endmodule