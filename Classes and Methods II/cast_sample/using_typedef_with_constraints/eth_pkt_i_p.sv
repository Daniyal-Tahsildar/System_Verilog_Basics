class eth_pkt;
//properties
    rand pkt_type_t pkt_t; 
    rand bit [9:0] len;
    rand bit [7:0] payload[$]; //queue of octets
    static int count;
//methods
    function new();
        count++;
    endfunction

// declaring a function as virtual enables polymorphism
// derived classes can change the function definition as required
//For polymorphism to work, function prototype should be same
    virtual function void print(string name = "eth_pkt");
        $display(name);
        $display("\tlen = %0d", len);
        $display("\tpayload = %p", payload);
        $display("\tcount = %0d\n", count);
    endfunction

//constraints
    constraint len_c{
        len inside{[15:25]};
    }

    constraint payload_c{
        payload.size() == len;
    }

endclass
    
//inherited classes

class eth_good_pkt extends eth_pkt;
    static int count_good;

    function new();
        count_good++;
    endfunction
    
    function void print(string name = "eth_pkt_good");
    // super is used to inherit base class method, changing the functionality
    // or adding new ones in derived class methods is called polymorphism
        super.print(name);
        $display("\tcount_good = %0d\n", count_good);
    endfunction

    constraint pkt_type_c {
        pkt_t == GOOD;
    }
endclass

class eth_bad_pkt extends eth_pkt;
    static int count_bad;

    function new();
        count_bad++;
    endfunction
    
    function void print(string name = "eth_pkt_bad");
        super.print(name);
        $display("\tcount_bad = %0d\n", count_bad);
    endfunction

    constraint pkt_type_c {
        pkt_t == BAD;
    }
endclass

class eth_ill_pkt extends eth_pkt;
    static int count_ill;

    function new();
        count_ill++;
    endfunction
    
    function void print(string name = "eth_pkt_ill");
        super.print(name);
        $display("\tcount_ill = %0d\n", count_ill);
    endfunction

    constraint pkt_type_c {
        pkt_t == ILL;
    }
endclass


