class some_pkt;
//properties
    bit [7:0] start;
    rand bit [15:0] len;
    rand bit [7:0] payload[$]; //queue of octets

//methods
    // new() is a built-in method 
    function new();
        start = 8'b1010_1011;
    endfunction

    // print() is a user defined method that takes in arguments
    function void print(string name = "some_pkt");
        $display(name);
        $display("\tstart = %h", start);
        $display("\tlen = %0d", len);
        $display("\tpayload = %p", payload);
    endfunction

//constraints
    constraint len_c{
        len inside{[5:10]};
    }

    constraint payload_c{
        payload.size() == len;
    }
endclass
    
    
module top;
// creating class instance (object)
    some_pkt pkt;

    initial begin
    // assigning memory to object 
        pkt = new();
        assert(pkt.randomize());
        
    // accessing method using '.' operator
        pkt.print("some_pkt");
    end
endmodule