//forward declaration
typedef class sample_pkt;
typedef class sample_good_pkt;
typedef class sample_bad_pkt;
typedef class sample_illegal_pkt;
typedef class sample_gen;
typedef class sample_drv;
typedef class sample_env;
typedef class common;

// if forward declaration is done, no need to put include files in order
`include "common.sv"
`include "sample_env.sv"
`include "sample_pkt.sv"
`include "sample_gen.sv"
`include "sample_drv.sv"

module top;
        
    sample_env env;
    
    initial begin
        env = new();
        env.run();

    end
endmodule