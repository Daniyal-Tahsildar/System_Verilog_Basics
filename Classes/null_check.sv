class some_pkt;
//properties
    bit [7:0] start;
    rand bit [15:0] len;

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
    endfunction

//constraints
    constraint len_c{
        len inside{[5:10]};
    }

endclass
    
    
module top;
// creating class instance (object)
    some_pkt pkt;

    initial begin

        if (pkt == null) begin
            $error ("Class object has not been allocated memory");
            pkt = new(); //assigning memory if not assigned
        end

// the following can also be used 
        // assert(!(pkt == null));

        assert(pkt.randomize());
        pkt.print();

// Note:
    // without using if conditions or assert statements for checks, the simulator generates a troublesome "bad 
    // handle or reference error" when memory allocation is unsuccessful. Debugging such errors proves challenging
    // as many simulators fail to provide precise line numbers or file locations where the issue occurs. Employing
    // null checks significantly enhances debugging capabilities by pinpointing the specific class object lacking
    // memory allocation. This proves invaluable, particularly when managing multiple classes.
        
    end
endmodule