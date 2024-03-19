// Each of the base and derived classes have a count field 

class sample_pkt;

    int count;    

    // function to print class fields 
    virtual function void print(string name = "sample_pkt");
        $display(name);
        $display("\tcount in base class= %0d", count);
    endfunction

    virtual function void change_count( int count);
// this.count here refers to the count in sample_pkt class while 
// the count in function argument refers to the one passed in
        this.count = count;
    endfunction

endclass
    

//inherited class_1
class sample_pkt_child_1 extends sample_pkt;
    int count;

    function void print(string name = "sample_pkt_child_1");
    // inherites the print function from parent class and can add more as well
        super.print(name);
        $display("\tcount in inherited class = %0d", count);
    endfunction

    function void change_count( int count);
// super.count here refers to the count field in the base class 
// this.count here refers to the count field in the this (inherited) class 
        super.count = count + 1;
        this.count = count + 3;
    endfunction

endclass

module top;
    
    //instantiating base class 
    sample_pkt pkt = new();
    //instantiating inherited classes    
    sample_pkt_child_1 pkt_1 = new();

    initial begin
        pkt.print();
        pkt_1.print();

    // changing count directly in base class
        pkt.change_count(1);
        pkt.print();

    // changing count in base class from derived class  
        pkt_1.change_count(3);
        pkt_1.print("after calling derived class method");

// NOTE: 
    // The count value in the base class is only modified for the current instance (`pkt_1`)
    // of the derived class. The original value of count in the base class remains unchanged, as it 
    // was assigned using the base class method directly.
    // This distinction arises because each instance has its own memory allocation. If the count in 
    // the base class were a static field, any changes made to it in a derived class instance would 
    // affect base class count field.

        pkt.print();

    end
endmodule