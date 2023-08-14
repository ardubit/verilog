// Half-adder
// =======================================
module h_Sum(s, c, a, b); 
  parameter delay = 0; // 16
  output s, c;
  input wire a, b;
  assign #(delay) s = a ^ b; 
  assign #(delay) c = a & b; 
endmodule

// Testbench
// =======================================
module tb();
  reg A, B;
  wire S_hS, C_hS;
  parameter Clock_Parameter = 64; 
 
 initial begin
  A = 0'b0; repeat(4) 
  begin 
  #(Clock_Parameter); A = ~A; 
  end 
  end
initial begin
  B = 0'b0; 
  repeat(2) 
  begin #(2*Clock_Parameter); 
  B = ~B; 
  end 
end
h_Sum A1(S_hS, C_hS, A, B); 
endmodule