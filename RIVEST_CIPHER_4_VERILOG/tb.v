`timescale 1ns / 1ps


module tb(

    );
    reg en_s,en_k,clk_rst,reset1,reset2,reset3,clk,enc,reset4,en_mod,reset_reg,reset_counter_final;
    reg [3:0] in1s,in2s,in2;
    top t (.clk_rst(clk_rst),.en_s(en_s),.enc(enc),.reset4(reset4),.reset_reg(reset_reg),.reset_counter_final(reset_counter_final),.clk(clk),.reset3(reset3),.en_k(en_k),.in1s(in1s),.in2s(in2s),.in_k(in2),.reset1(reset1),.reset2(reset2),.en_mod(en_mod),.in_k(in2));
    wire [3:0] c1,c2,c3,s1,k1,j,m1,temp_si,temp_sj,swapped_si,swapped_sj,ss1,c22,c33,wmi,wj,ss2,wt,ss3,cf1;
    wire[4:0] a1,a2,wij;
    wire clk_t;
    integer k;
    initial begin
   #6in1s=4'd1;
    in2s=4'd2;
   #20in1s=4'd12;
    in2s=4'd3;
   #20in1s=4'd4;
    in2s=4'd5;
   #20in1s=4'd6;
      in2s=4'd7;
   #20in1s=4'd8;
     in2s=4'd9;
   #20in1s=4'd10;
      in2s=4'd11;
   #20in1s=4'd13;
     in2s=4'd14;
   #20in1s=4'd9;
     in2s=4'd1;
   end
    
     initial begin
   #6in2=4'd7;
   #20in2=4'd14;
   #20in2=4'd11;
   #20in2=4'd6;
   #20in2=4'd4;
   #20in2=4'd5;
   #20in2=4'd6;
   #20in2=4'd7;
   #20in2=4'd8;
   #20in2=4'd9;
   #20in2=4'd10;
   #20in2=4'd11;
   #20in2=4'd13;
   #20in2=4'd14;
   #20in2=4'd9;
   #20in2=4'd1;
   end
   
 
    initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
    end
  
  initial begin
  clk_rst =1'b1;
  #2 clk_rst = 1'b0;
  end
  
  
    initial
begin
 en_s=1'b1;
 #155en_s=1'b0;
end
initial begin
reset_reg = 1'b0;
#639 reset_reg = 1'b1;
#2 reset_reg = 1'b0;
end
    initial
begin
 enc=1'b1;
 #150 enc = 1'b0;
 #380 enc = 1'b1;
end



    initial
begin
 reset4=1'b0;
 #354 reset4 = 1'b1;
 #21 reset4 = 1'b0;
end


initial begin
en_mod = 1'b0;
#630 en_mod = 1'b1;
end

    initial
begin
 en_k=1'b1;
 #320 en_k=1'b0;
end

initial
begin
 reset2=1'b0;
 #155 reset2=1'b1;
end

initial
begin
 reset3=1'b0;
 #329 reset3=1'b1;
 #2 reset3 = 1'b0;
 
end


initial
begin
 reset_counter_final= 1'b1;
 #5 reset_counter_final = 1'b0;
 #654 reset_counter_final = 1'b1;
 #3 reset_counter_final= 1'b0;
 
 
end
initial
begin
 reset1=1'b1;
 #5 reset1 = 1'b0;
 #315 reset1 = 1'b1;
 #5 reset1 = 1'b0;

end

assign c1 = t.uc.q;
assign c2 = t.uc1.q;
assign c3 = t.c3;
assign s1 = t.S_array.out1;
assign k1 = t.K_array.out1;
assign a1 = t.add1.out;
assign j = t.r.dout;
assign a2 = t.add2.out;
assign m1 = t.m.out;
assign temp_si = t.r1.dout;
assign temp_sj = t.S_array_2.out1;
assign swapped_si = t.sw.out2;
assign swapped_sj = t.sw.out1;
assign ss1 = t.a.out1;
assign c22 = t.uc2.q;
assign c33 = t.c33;
assign wmi = t.m2.out;
assign wj = t.rc1.dout;
assign wij = t.addd.out;
assign ss2 = t.wjk.out1;
assign wt = t.m4.out;
assign ss3 = t.final.out1;
assign cf1 = t.ucc3.q;
assign clk_t = t.cd.out;
reg[3:0] temp_out11,temp_addo11;
initial begin
    #900;
    for(k=0;k<16;k=k+1)
        begin
          #20 temp_addo11 = (k);
           temp_out11 = t.wrt.memory[temp_addo11];
        end
     end




endmodule