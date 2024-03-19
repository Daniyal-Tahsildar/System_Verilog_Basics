class sample_pkt;
    //properties
    bit [7:0] start;
    rand bit [15:0] len;
    rand bit [7:0] payload[$]; //queue of octets
    
    //methods
    // new constructor with field initialization
    function new();
        start = 8'b1010_1011;
    endfunction

    // function to print class fields 
    function void print(string name = "sample_pkt");
        $display(name);
        $display("\tstart = %0d", start);
        $display("\tlen = %0d", len);
        $display("\tpayload = %p", payload);
    endfunction

//constraints
    constraint len_c{
        len inside{[10:30]};
    }

    constraint payload_c{
        payload.size() == len;
    }
endclass
    

//inherited class
class sample_pkt_child extends sample_pkt;
    rand bit [3:0] count;

    function new();
        // All base class properties and methods are available in derived class,
        // hence there's no need to declare base class fields again 
         start = 8'b1111_1111;
    endfunction

    function void print(string s = "sample_pkt_child");
    // super is used to refer to base class methods
        // inherites the print function from parent class and can add more as well
        super.print(s);
        $display("\tcount = %0d", count);
    endfunction

// other parent class functions (methods) can be declared here using super keyword
// Inherited classes alredy have access to base class methods
endclass


module top;
    sample_pkt pkt;
    //instantiating inherited class    
    sample_pkt_child child_pkt;

    initial begin
    // base class
        pkt = new();
        assert(pkt.randomize());
        pkt.print("sample_pkt");
    
    // derived class
        child_pkt = new();
        assert(child_pkt.randomize());
        child_pkt.print("sample_pkt_child");

    end
endmodule