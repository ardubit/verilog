library verilog;
use verilog.vl_types.all;
entity mux4_struct is
    port(
        Y               : out    vl_logic;
        S               : in     vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic
    );
end mux4_struct;
