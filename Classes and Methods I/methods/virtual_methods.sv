class sample_pkt;
//properties
    protected rand bit [7:0] data; 
    protected rand bit [7:0] sa;

    rand bit [3:0] len;
    rand bit [7:0] payload[$]; //queue of octets


//methods
    // function to print class fields 
    virtual function void print(string name = "sample_pkt");
        $display(name);
        $display("\tdata = %0d", data);
        $display("\tsa = %0d", sa);
        $display("\tlen = %0d", len);
        $display("\tpayload = %p", payload);
    endfunction

    // virtual functions can also be left empty in base class
    virtual function void fix_len();

    endfunction

//constraints
    constraint len_c{
        len inside{[1:10]};
    }

    constraint payload_c{
        payload.size() == len;
    }
endclass
    

//inherited class_1
class sample_pkt_child_1 extends sample_pkt;
    rand bit [3:0] count;

    function void print(string name = "sample_pkt_child_1");
    // inherites the print function from parent class and can add more as well
        super.print(name);
        $display("\tcount = %0d", count);
    endfunction

    function void fix_len();
        len = 4'd5;
        $display("\nlen fixed to %0d in class sample_pkt_child_1", len);
    endfunction
endclass

//inherited class_2
class sample_pkt_child_2 extends sample_pkt;
    rand bit [3:0] count;

    function void print(string name = "sample_pkt_child_1");
    // inherites the print function from parent class and can add more as well
        super.print(name);
        $display("\tcount = %0d", count);
    endfunction

    function void fix_len();
        len = 4'd9;
        $display("\nlen fixed to %0d in class sample_pkt_child_2", len);
    endfunction
endclass


module top;
    
    //instantiating base class 
    sample_pkt pkt;
    //instantiating inherited classes    
    sample_pkt_child_1 pkt_1 = new();
    sample_pkt_child_2 pkt_2 = new();

    initial begin
        assert(pkt_1.randomize());
        assert(pkt_2.randomize());
        pkt_1.print("sample_pkt_child_1");
        pkt_2.print("sample_pkt_child_2");

// ******** inherited classes can be assigned to the base class, based on 
// which derived class is assigned, different implementations for the 
// method take effect ********
        pkt = pkt_1;
        pkt.fix_len(); // fix_len from pkt_1 takes effect

        pkt = pkt_2;
        pkt.fix_len(); // fix_len from pkt_2 takes effect

    end
endmodule