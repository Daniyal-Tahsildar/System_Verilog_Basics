class sample_pkt;
//properties
    //static properties are assigned a common memory for all instantiations
    // any changes made in one instantiation are reflected on all instantiations
        static bit [7:0] start;
        bit [15:0] len;   
         
//methods
    // print() is a user defined method that takes in arguments
    function void print(string name = "sample_pkt");
        $display(name);
        $display("\tstart = %h", start);
        $display("\tlen = %0d", len);
    endfunction

// an automatic data type can only be inside a procedural block,
// tasks and functions by default are automatic type. 
    task assign_size(string s = "assign_size");
        static int size_1 = 1;
        automatic int size_2 = 2;
        $display(s);
        $display("\tsize_1 = %0d", size_1);
        $display("\tsize_2 = %0d", size_2);
    endtask

endclass
    
    
module top;
// creating class instance (object)
    sample_pkt pkt_1, pkt_2;

    initial begin
    // assigning memory to object 
        pkt_1 = new();
        pkt_2 = new();
        
        pkt_1.print("pkt_1 after initialization");
        pkt_1.assign_size("default sizes"); 
    // changing value of size_1 using hierarchical access
        pkt_1.assign_size.size_1 = 12;

    // the following will give an error since size_2 is an automatic type 
        // pkt_1.assign_size.size_2 = 13;
        pkt_1.assign_size("size after update"); // size_1 takes the updated value 

// ##########################################################################

// Accessing static fields in a class:
    // can be done using scope resolution operator (::)
        // Note: scope resolution can only be used to access classes or packages 
        // and not the objects created using them

        sample_pkt::start = 8'hA_D;
        pkt_1.len = 15'd2;
        pkt_1.print("pkt_1 after update");
    
    // pkt_2 will have the same value of start as pkt_1 but len will have its initialized value
        pkt_2.print("pkt_1 after update");


    end
endmodule