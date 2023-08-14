// D02. Multiplexer
// Y =!SA + SB
// if not S then A or if S then B

// Struct
// ======================================
// it's not the best design approach (for huge project) if elements are basic gates
module mux2_struct (output Y, 
                     input S, 
                     input A, 
                     input B);
  // output is only "wire" type
  wire Sbar, w1, w2; 
  
  // output first, then inputs
  not d1(Sbar, S);
  and d2(w1, Sbar, A);
  and d3(w2, S, B);
  or d4(Y, w1, w2);
endmodule

// Data Flow
// ======================================
module mux2_dataflow (output Y,
                       input S,
                       input A,
                       input B);
  // "assign" always generate some digital circuit                    
  assign Y = ((!S) * A) || (S * B);
endmodule

// Functional
// ======================================
module mux2_funct(output reg Y,
                       input S,
                       input A,
                       input B);
                  
  // "always" is procedural operator
  // statements inside an "always" block are executed sequentially, not once!
  // "@" is an operator "wait event"
  
  // inside "always" block can only assign to reg or variables not wire
  always @(S or A or B)
    if(S)
      Y = B;
    else
      Y = A;
endmodule

// Testbench
// =======================================

// "initial" - not synthesizable, is started at the beginning of a simulation at time 0 unit. 
// this block will be executed only once during the entire simulation.

module testbench_lab2;
  reg a;
  reg b;
  reg s; // select
  wire y1, y2, y3;
  
  mux2_struct uut1(.Y(y1), .A(a), .B(b), .S(s));
  mux2_dataflow uut2(.Y(y2), .A(a), .B(b), .S(s));
  mux2_funct uut3(.Y(y3), .A(a), .B(b), .S(s));
  
  integer i, j;
  initial begin
    $display("Testbench is running");
    #10;
    
    a = 1; b = 0; s = 0; // expected Y = A
    //if(y1 == a)
      //$display("Test Y = A is OK");
    #10;
    
    a = 0; b = 1; s = 1; // expected Y = B
    //if(y1 == b)
      //$display("Test Y = B is OK");
    #10;

    //for(i = 0; i <= 1; i = i + 1) begin
      // code
      //for (;;) begin
        // code
      //end
    //end
  end
endmodule
