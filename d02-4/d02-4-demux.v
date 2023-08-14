// D02-4. 4 Output Demultiplexer DEMMUX
// Input:     Y   Output: A, B, C, D (and vice versa for DEMUX)
// Select:    S0, S1

// DEMUX:     A = ((!S0)*(!S1)*Y)
//            B = (S0*(!S1)*Y)
//            C = ((!S0)*S1*Y)
//            D = (S0*S1*Y)

// Struct
// ======================================
// it's not the best design approach (for huge project) if elements are basic gates
module demux4_struct (output A, 
                      output B,
                      output C,
                      output D,
                       input Y,
                      input S0,
                      input S1);
  // output is only "wire" type
  wire S0bar, S1bar; 
  
  // output first, then inputs
  not d0(S0bar, S0);
  not d1(S1bar, S1);
  and d2(A, S0bar, S1bar, Y);
  and d3(B, S0, S1bar, Y);
  and d4(C, S0bar, S1, Y);
  and d5(D, S0, S1, Y);
endmodule

// Data Flow
// ======================================
module demux4_dataflow (output A, 
                        output B,
                        output C,
                        output D,
                         input Y,
                        input S0,
                        input S1);
  // "assign" always generate some digital circuit                    
  assign A = ((!S0)*(!S1)*Y);
  assign B = (S0*(!S1)*Y);
  assign C = ((!S0)*S1*Y);
  assign D = (S0*S1*Y);
endmodule

// Functional
// ======================================
module demux4_funct(output reg A, 
                    output reg B,
                    output reg C,
                    output reg D,
                         input Y, 
                  input [0:0] S0,
                  input [0:0] S1);               
  // "always" is procedural operator
  // statements inside an "always" block are executed sequentially, not once!
  // "@" is an operator "wait event"
  // inside "always" block can only assign to reg or variables not wire
  
  reg [1:0] sel;
  always @(S0 or S1 or Y) begin
    sel = {S1, S0};
    case(sel)
      2'b00: begin A = Y; B = 0; C = 0; D = 0; end // 0     
      2'b01: begin A = 0; B = Y; C = 0; D = 0; end // 1
      2'b10: begin A = 0; B = 0; C = Y; D = 0; end // 2 
      2'b11: begin A = 0; B = 0; C = 0; D = Y; end // 3
      default: A = 0; 
    endcase
  end
endmodule

// Testbench
// =======================================
// "initial" - not synthesizable, is started at the beginning of a simulation at time 0 unit. 
// this block will be executed only once during the entire simulation.

module testbench_demux;
  wire a1, a2, a3;
  wire b1, b2, b3;
  wire c1, c2, c3;
  wire d1, d2, d3;
  reg s0, s1;       // select
  reg y;            // testbench output signal
  
  demux4_struct dut1(.A(a1), .B(b1), .C(c1), .D(d1), .S0(s0), .S1(s1), .Y(y));
  demux4_dataflow dut2(.A(a2), .B(b2), .C(c2), .D(d2), .S0(s0), .S1(s1), .Y(y));
  demux4_funct dut3(.A(a3), .B(b3), .C(c3), .D(d3), .S0(s0), .S1(s1), .Y(y));
  
  integer i, j;
  initial begin
    $display("Testbench is running!");
    y = 0;
    
    for(i = 0; i <= 1; i = i + 1) begin
      s0 = 0; 
      s1 = 0;
      y = !i;
      $display("Input:  Y:[%b]", y);
 
      for (j = 0; j <= 3; j = j + 1) begin
        {s1, s0} = j;        
        #5;
        $display("Select: S1:[%b], S0:[%b], J:[%d]", s1, s0, j);
      end
      
    end
  end
endmodule
