// Full-Adder
// =======================================
module F_Sum(s, c_0, a, c_i, b); 
  output s, c_0;
  input wire a, c_i, b;
  wire n_s, n_c_1, n_c_2;
  h_Sum A2(.s(n_s), .c(n_c_1), .a(a), .b(c_i)); 
  h_Sum A3(.s(s), .c(n_c_2), .a(n_s), .b(b)); 
  or A4(c_0, n_c_1, n_c_2);
endmodule

// Testbench
// =======================================
module tb_S();
  reg A, C_i, B;
  wire [1:0] S_S;
  wire [2:0] C_S;
  parameter Clock_Parameter = 64; 
  initial begin
    A = 0'b0; 
    repeat(8) 
    begin #(Clock_Parameter); 
    A =~A; 
    end 
    #(2*Clock_Parameter);
  end
  initial begin
  C_i = 0'b0; 
  repeat(4) 
  begin #(2*Clock_Parameter); 
  C_i = ~C_i; 
  end #(2*Clock_Parameter);
end
initial begin
  B = 0'b0; 
  repeat(2) begin 
  #(4*Clock_Parameter); 
  B = ~B; 
  end #(2*Clock_Parameter);
end
F_Sum A5(S_S, C_S, A, C_i, B); 
endmodule
