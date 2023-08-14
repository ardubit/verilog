// Code your testbench here
// or browse Examples

module pack_unpack;
  integer i, j;
  reg [0:0] b0;
  reg [0:0] b1;
  
  initial begin
    i = 2;
    j = 0;
    {b1, b0} = i;
    
    $display("Unpack: Bit-1 [%b], Bit-0 [%b], Input:%d", b1, b0, i);
    
    j = {b1, b0};
    $display("Packed: Bit-1 [%b], Bit-0 [%b], Input:%d", b1, b0, i);
    
  end
endmodule
