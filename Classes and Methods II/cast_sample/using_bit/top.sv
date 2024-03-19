//******Cast done in eth_bfm.sv******

//forward declaration
typedef class eth_pkt;
typedef class eth_good_pkt;
typedef class eth_bad_pkt;
typedef class eth_ill_pkt;
typedef class eth_gen;
typedef class eth_bfm;
typedef class eth_env;
typedef class eth_common;

// if forward declaration is done, no need to put include files in order
`include "eth_common.sv"
`include "eth_env.sv"
`include "eth_pkt_i_p.sv"
`include "eth_gen.sv"
`include "eth_bfm.sv"

module top;
        
    eth_env env;
    
    initial begin
        env = new();
        env.run();

    end
endmodule