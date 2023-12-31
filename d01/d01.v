// D01. Logic Expression

// Data Flow. Thinking of "Logic Expressions"
// =======================================
module lab01_dataflow (output Y, 
                       input A, 
                       input B, 
                       input C, 
                       input D);
  assign Y = (!(A || B)) * (!(C * D));
endmodule

// Struct. Thinking of "Connecting blocks"
// =======================================
module lab01_struct (output Y, 
                     input A, 
                     input B, 
                     input C,
                     input D);
  wire w1;
  wire w2;
  nor dd1 (w1, A, B);
  nand dd2 (w2, C, D);
  and dd3 (Y, w1, w2);
endmodule

// Functional. Thinking of "How to Programm"
// =======================================
module lab01_funct (output reg Y, 
                    input A, 
                    input B, 
                    input C, 
                    input D);

  // statements inside an "always" block are executed sequentially, not once!
  // "always" is procedural operator
  always @( A or B or C or D)
    Y = (!(A || B)) * (!(C * D));
endmodule

// Testbench
// =======================================
module testbench_lab1;
  reg a;
  reg b; 
  reg c; 
  reg d;
  wire y1, y2, y3;

  lab01_dataflow uut1 (.Y(y1), .A(a), .B(b), .C(c), .D(d));
  lab01_struct uut2 (.Y(y2), .A(a), .B(b), .C(c), .D(d));
  lab01_funct uut3 (.Y(y3), .A(a), .B(b), .C(c), .D(d));

  integer i;
  initial begin
    for (i = 0; i <= 15; i = i + 1) begin
      {a, b, c, d} = i[3:0];
      #10;
      
      $display("Input: %b, A:%b, B:%b, C:%b, D:%b", i, a, b, c, d); 
    end
  end
endmodule
