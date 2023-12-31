// Carry-lookahead Adder
// =======================================
module bit_4_Sum_parr(s, c_0, a, c_i, b); 
  output [3:0] s;
  output [3:0] c_0;
  input wire [3:0] a;
  input wire c_i;
  input wire [3:0] b;
  Sum_parr A13(.s(s[0]), .C_i1(c_0[0]), .a(a[0]), .c_i(c_i), .b(b[0])); 
  Sum_parr A14(.s(s[1]), .C_i1(c_0[1]), .a(a[1]), .c_i(c_0[0]), .b(b[1])); 
  Sum_parr A15(.s(s[2]), .C_i1(c_0[2]), .a(a[2]), .c_i(c_0[1]), .b(b[2])); 
  Sum_parr A16(.s(s[3]), .C_i1(c_0[3]), .a(a[3]), .c_i(c_0[2]), .b(b[3])); 
endmodule

// Testbench
// =======================================
module tb_S_parr(); 
  reg [3:0] A;
  reg C_i;
  reg [3:0] B;
  wire [3:0] S_S;
  wire [3:0] C_S;
  parameter Clock_Parameter = 64; 

initial begin 
A[0] = 0'b0; repeat(16) begin 
#(Clock_Parameter); A[0] = ~A[0]; end 
#(2*Clock_Parameter);
end

initial begin 
A[1] = 0'b0; repeat(8) begin 
#(2*Clock_Parameter); A[1] = ~A[1]; end  
#(2*Clock_Parameter);
end

initial begin 
A[2] = 0'b0; repeat(4) begin 
#(4*Clock_Parameter); A[2] = ~A[2]; end 
#(2*Clock_Parameter);
end

initial begin 
A[3] = 0'b0; repeat(2) begin 
#(8*Clock_Parameter); A[3] = ~A[3]; end
#(2*Clock_Parameter);
end

initial begin 
C_i = 0'b0; repeat(4) begin 
#(4*Clock_Parameter); C_i = ~C_i; end 
#(2*Clock_Parameter);
end

initial begin 
B[0] = 0'b0; repeat(2) begin 
#(8*Clock_Parameter); B[0] = ~B[0]; end
#(2*Clock_Parameter);
end

initial begin 
B[1] = 0'b0; repeat(4) begin 
#(4*Clock_Parameter); B[1] = ~B[1]; end
#(2*Clock_Parameter);
end

initial begin 
B[2] = 0'b0; repeat(8) begin 
#(2*Clock_Parameter); B[2] = ~B[2]; end
#(2*Clock_Parameter);
end

initial begin 
B[3] = 0'b0; repeat(16) begin 
#(Clock_Parameter); B[3] = ~B[3]; end 
#(2*Clock_Parameter);
end

bit_4_Sum_ser A17(S_S, C_S, A, C_i, B); 
endmodule
