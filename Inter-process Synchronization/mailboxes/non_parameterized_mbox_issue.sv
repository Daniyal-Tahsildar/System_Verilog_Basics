typedef class c1; // forward declaration of class c1


// A common class that holds mailbox handles
class common;
    static mailbox mbox_np = new(); // non-parameterized mailbox
    static mailbox #(int) mbox_p1 = new(); // parameterized mailbox (int type)
    static mailbox #(c1) mbox_p2 = new(); // parameterized mailbox (class type)
endclass


// sample class 1 
class c1;
    byte a = 5;
    bit [5:0] b = 7;

    task run();
    // creating a c1 instance
        c1 c1_inst = new this;
        // static properties can be accessed using scope resolution
    // non-parameterized mailbox
        common:: mbox_np.put(a);
        common:: mbox_np.put(b);
    // parameterized mailbox (int type)
        common:: mbox_p1.put(a);
        common:: mbox_p1.put(b);
    // parameterized mailbox (class type)
        common:: mbox_p2.put(c1_inst);

    // display statements
        $display("mailboxes after putting data in:");
        $display("mbox_np: \n\t%p", common::mbox_np);
        $display("mbox_p1: \n\t%p", common::mbox_p1);
        $display("mbox_p2: \n\t%p", common::mbox_p2);

    endtask
endclass


// sample class 2
class c2;
    int c, d;

    task run();
        c1 c1_i; // c1 class object
        $display("c1_i before getting data from mailbox = %p", c1_i);

    // non-parameterized mailbox
        // int and byte are both integral type, the following will not result in an error
        common:: mbox_np.get(c);
        common:: mbox_np.get(d);
        // getting mailbox item as a class type, this will give run time errors
        // common:: mbox_np.get(c1_i);

    // parameterized mailbox (int type)
        common:: mbox_p1.get(c);
        common:: mbox_p1.get(d);
        // getting int parameterized mailbox item as a class type, this will give compile time errors
        // common:: mbox_p1.get(c1_i);
        
    // parameterized mailbox (class type)
        common:: mbox_p2.get(c1_i);

    // display statements
        $display("c and d will hold values of latest data recieved, (from mbox_p1, not mbox_np):\n\t c = %0d, d = %0d", c, d);
        $display("c1_i after getting data from mailbox = %p", c1_i);

    endtask
endclass



module top;
    c1 c1_inst = new();
    c2 c2_inst = new();

    // to store number of mailbox elements
    int number_np, number_p1, number_p2;

    initial begin
        $display("c1_inst = %p", c1_inst);
    // running task for putting data in mailbox
        c1_inst.run();

    // number of elements after using put()
        number_np = common::mbox_np.num();
        number_p1 = common::mbox_p1.num();
        number_p2 = common::mbox_p2.num();
        $display("\nnumber_np = %0d, number_p1 = %0d, number_p2 = %0d\n", number_np, number_p1, number_p2);

    // running task for getting data from mailbox
        c2_inst.run();
        $display("c2_inst = %p", c2_inst);

    end
endmodule