// D02-4. 4 Input Multiplexer MUX
// Inputs:    A, B, C, D    Output: Y (and vice versa for DEMUX)
// Select:    S0, S1
// MUX:       Y = ((!S0)*(!S1)*A) || (S0*(!S1)*B) || ((!S0)*S1*C) || (S0*S1*D);

// Struct
// ======================================
// it's not the best design approach (for huge project) if elements are basic gates
module mux4_struct (output Y, 
                     input S0,
                     input S1, 
                     input A, 
                     input B,
                     input C,
                     input D);
  // output is only "wire" type
  wire S0bar, S1bar, w2, w3, w4, w5; 
  
  // output first, then inputs
  not d0(S0bar, S0);
  not d1(S1bar, S1);
  and d2(w2, S0bar, S1bar, A);
  and d3(w3, S0, S1bar, B);
  and d4(w4, S0bar, S1, C);
  and d5(w5, S0, S1, D);
  or d6(Y, w2, w3, w4, w5);
endmodule

// Data Flow
// ======================================
module mux4_dataflow (output Y, 
                       input S0,
                       input S1, 
                       input A, 
                       input B,
                       input C,
                       input D);
  // "assign" always generate some digital circuit                    
  assign Y = ((!S0)*(!S1)*A) || (S0*(!S1)*B) || ((!S0)*S1*C) || (S0*S1*D);
endmodule

// Functional
// ======================================
module mux4_funct(output reg Y, 
                   input [0:0] S0,
                   input [0:0] S1, 
                   input A, 
                   input B,
                   input C,
                   input D);               
  // "always" is procedural operator
  // statements inside an "always" block are executed sequentially, not once!
  // "@" is an operator "wait event"
  // inside "always" block can only assign to reg or variables not wire
  
  reg [1:0] sel;
  always @(S0 or S1 or A or B or C or D) begin
    sel = {S1, S0};
    case(sel)
      2'b00: Y = A; // 0
      2'b01: Y = B; // 1
      2'b10: Y = C; // 2
      2'b11: Y = D; // 3
      default: Y = 0; 
    endcase
  end
endmodule

// Testbench
// =======================================

// "initial" - not synthesizable, is started at the beginning of a simulation at time 0 unit. 
// this block will be executed only once during the entire simulation.

module testbench_mux;
  reg a, b, c, d;   // testbench output signals
  reg s0, s1;       // select
  wire y1, y2, y3;  // out
  
  mux4_struct uut1(.Y(y1), .A(a), .B(b), .C(c), .D(d), .S0(s0), .S1(s1));
  mux4_dataflow uut2(.Y(y2), .A(a), .B(b), .C(c), .D(d), .S0(s0), .S1(s1));
  mux4_funct uut3(.Y(y3), .A(a), .B(b), .C(c), .D(d), .S0(s0), .S1(s1));
  
  integer i, j, x;
  initial begin
    $display("Testbench is running!");

    for(i = 0; i <= 3; i = i + 1) begin
      s0 = 0;
      s1 = 0;
      x = (1'b1 << i);
      {d, c, b, a} = x;
      $display("Input:  A:[%b], B:[%b], C:[%b], D:[%b]", a, b, c, d);
 
      for (j = 0; j <= 3; j = j + 1) begin
        {s1, s0} = j;        
        #5;
        $display("Select: S1:[%b], S0:[%b], J:[%d]", s1, s0, j);
      end
      
    end
  end
endmodule
