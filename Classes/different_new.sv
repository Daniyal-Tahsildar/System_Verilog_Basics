// Each class implements a different way of using the new() constructor

//new is the default definition
class sample_1;
    bit [15:0] sync; 
    bit [7:0] start;
    logic [7:0] data;
endclass

//new is used to initialize certain fields
class sample_2;
    bit [15:0] sync; 
    bit [7:0] start;
    logic [7:0] data;
    
    function new();
        sync = {8{2'b10}};
        start = 8'b1010_1011;
    endfunction
endclass

// arguments are passes in new, and user can 
// assign values to fields included in new 
class sample_3;
    bit [15:0] sync; 
    bit [7:0] start;
    logic [7:0] data;
    
    function new(bit [15:0] sync, bit [7:0] start_t);
        this.sync = sync;
        start = start_t;
    endfunction
endclass

// arguments are passes in new, and user can assign values to fields
// included in new, along with default values that prevent errors 
class sample_4;
    bit [15:0] sync; 
    bit [7:0] start;
    logic [7:0] data;
    
    function new(bit [15:0] sync = {4{4'hC}}, bit [7:0] start_t = 8'b1110_1011);
        this.sync = sync;
        start = start_t;
    endfunction
endclass


module top;

    sample_1 s_1 = new();
    sample_2 s_2 = new();
    sample_3 s_3 = new({4{4'hF}}, 8'hA_9);
    sample_4 s_4 = new();

    initial begin 
        $display("Sample class 1, uses default definition of new: \n\t sync: %h, start = %h", s_1.sync, s_1.start);
        $display("Sample class 2, initializes certain feilds in default definition of new: \n\t sync: %h, start = %h", s_2.sync, s_2.start);
       
    // *************Not assigning field values for s_3 will cause errors*************
        $display("Sample class 3, requires user to assign certain fields for initialization in new: \n\t sync: %h, start = %h", s_3.sync, s_3.start);
        
    // *************Not assigning field values for s_4 will NOT cause errors, default values are taken*************
        $display("Sample class 4, requires user to assign certain fields for initialization but also has default values if no input is provided:");
        $display("\t Without providing field initialization in new: \n\t\t sync: %h, start = %h", s_4.sync, s_4.start);

        #5 // delay to prevent race condition while displaying
        s_4 = new({14{4'hB}}, 8'hAC);
        $display("\t Providing field initialization in new: \n\t\t sync: %h, start = %h", s_4.sync, s_4.start);
        
    end
endmodule