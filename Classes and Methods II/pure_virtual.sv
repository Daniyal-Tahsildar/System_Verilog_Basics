// Pure virtual methods can only be inside abstract class or interface class  

virtual class sample_pkt;
//properties
    protected rand bit [7:0] data; 
    protected rand bit [7:0] sa;

    rand bit [3:0] len;
    rand bit [7:0] payload[$]; //queue of octets


//methods
// if any derved class does not implement the following methods, it leads to errors
    // function to print class fields 
    pure virtual function void print(string name);

    // virtual functions can also be left empty in base class
    pure virtual function void fix_len();


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
    // derived class can have its own implementation of the virtual function
        $display(name);
        $display("\tdata = %0d", data);
        $display("\tsa = %0d", sa);
        $display("\tlen = %0d", len);
        $display("\tpayload = %p", payload);
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

    function void print(string name = "sample_pkt_child_2");
        $display(name);
        $display("\tcount = %0d", count);
    endfunction

    function void fix_len();
        len = $urandom_range(0, 4);
        $display("\nlen fixed to %0d in class sample_pkt_child_2", len);
    endfunction
endclass



module top;
    
    sample_pkt_child_1 pkt_1 = new();
    sample_pkt_child_2 pkt_2 = new();

    initial begin
        assert(pkt_1.randomize());
        assert(pkt_2.randomize());
        pkt_1.print("sample_pkt_child_1");
        pkt_2.print("sample_pkt_child_2");

        pkt_1.fix_len(); 
        pkt_2.fix_len(); 

    end
endmodule