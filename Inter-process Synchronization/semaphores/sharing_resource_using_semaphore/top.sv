// EDA playground issue: Mentor Questa and Synopsys VCS are not printing the 
// transaction class names correctly, Aldec Riviera Pro is used for this example

// Driver_1 requires #3 timesteps to complete transactions, while Driver_2 
// requires #1 timestep, only 1 driver can drive signals at any given time, 
// and the resources are limited to 1 generator and 1 mailbox, without using 
// semaphores achieving this kind of synchornization whould prove difficult.


//forward declaration
typedef class sample_pkt;
typedef class sample_good_pkt;
typedef class sample_bad_pkt;
typedef class sample_illegal_pkt;
typedef class sample_gen;
typedef class sample_drv_1;
typedef class sample_drv_2;
typedef class sample_env;
typedef class common;

// if forward declaration is done, no need to put include files in order
`include "common.sv"
`include "sample_env.sv"
`include "sample_pkt.sv"
`include "sample_gen.sv"
`include "sample_drv_1.sv"
`include "sample_drv_2.sv"

module top;
    sample_env env;
    
    initial begin
        env = new();
        env.run();
    end
endmodule