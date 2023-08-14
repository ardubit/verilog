module lab01_dataflow (output Y, 
                       input A, 
                       input B, 
                       input C, 
                       input D);
assign Y = (!(A || B)) * (!(C * D));
endmodule

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

module lab01_funct (output reg Y, 
                    input A, 
                    input B, 
                    input C, 
                    input D);
always @( A or B or C or D)
Y = (!(A || B)) * (!(C * D));
endmodule

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
  reg [3:0] mask = 4'b01;	// 1 = 4'b01
							//reg [3:0] input_data = 0;
							//reg [3:0] mask_a = 8; // 4?b1000;
							//reg [3:0] mask_c = 4; // 4?b0100;
							//reg [3:0] mask_c = 2; // 4?b0010;
							//reg [3:0] mask_d = 1; // 4?b0001;
  initial begin
    for (i = 0; i <= 15; i = i + 1) begin
      //{a, b, c, d} = input_data;

      $display("Input: %d", i);
      a = i & (mask << 3);
      b = i & (mask << 2);
      c = i & (mask << 1);
      d = i & (mask << 0);
      #10;
							// input_data = i + 1;
      // debug
      $display("Input: %b, A:%b, B:%b, C:%b, D:%b", i, a, b, c, d); 
    end
  end
endmodule
