class sample_pkt;
//properties

    //local can only be accessed by this class
    local bit [55:0] preamble; 
    local bit [7:0] start_frame;
    
    // protected can be accessed by this class and its child classes
    protected rand bit [47:0] da; 
    protected rand bit [47:0] sa;

    rand bit [15:0] len;
    rand bit [7:0] payload[$]; //queue of octets


//methods
    // new constructor with field initialization
    function new();
        preamble = {28{2'b10}};
        start_frame = 8'b1010_1011;
    endfunction

    // function to print class fields 
    function void print(string name = "sample_pkt");
        $display(name);
        $display("\tpreamble = %0d", preamble);
        $display("\tstart_frame = %0d", start_frame);
        $display("\tda = %0d", da);
        $display("\tsa = %0d", sa);
        $display("\tlen = %0d", len);
        $display("\tpayload = %p", payload);
    endfunction

    //functions to change protected properties
    function void set_da( bit [47:0] da_t, string scope = "");
        da = da_t;
        $display("da changed to %0d by %s", da, scope);
    endfunction

    // function to access protected properties
    function void get_da( output bit [47:0] da_g, input string scope = "");
        da_g = da;
        $display("da assigned in %s", scope);
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

    function void print(string s = "sample_pkt_child");
    // inherites the print function from parent class and can add more as well
        super.print(s);
        $display("\tcount = %0d", count);
    endfunction
// other parent class functions (methods) can be declared here using super keyword
// since we do not need to add/change functionality of the base class methods
// they are not declared here. Inherited classes alredy have access to base class methods
endclass


module top;
    // to store value of da
    bit [47:0] da_val;

    //instantiating inherited class    
    sample_pkt_child pkt = new();

    initial begin
        pkt = new();
        assert(pkt.randomize());
        pkt.print("sample_pkt_child");

        // pkt.preamble = 200; // illegal since preable is a local property in base class

        pkt.set_da($random, "top");

// Accessing protected property outside class using a function
        pkt.get_da(da_val, "top");
        pkt.print("sample_pkt_child");

    end
endmodule