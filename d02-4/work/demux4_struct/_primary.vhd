library verilog;
use verilog.vl_types.all;
entity demux4_struct is
    port(
        A               : out    vl_logic;
        B               : out    vl_logic;
        C               : out    vl_logic;
        D               : out    vl_logic;
        Y               : in     vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic
    );
end demux4_struct;
