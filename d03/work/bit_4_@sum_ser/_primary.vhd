library verilog;
use verilog.vl_types.all;
entity bit_4_Sum_ser is
    port(
        s               : out    vl_logic_vector(3 downto 0);
        c_0             : out    vl_logic_vector(3 downto 0);
        a               : in     vl_logic_vector(3 downto 0);
        c_i             : in     vl_logic;
        b               : in     vl_logic_vector(3 downto 0)
    );
end bit_4_Sum_ser;
