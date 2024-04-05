// A common class that holds mailbox handles, can also be done in top module, but 
// it is good practice to place all common properties and methods in one class
class common;
    static mailbox mbox = new(); 
endclass


// *********************************************************************************************
// a static mailbox has a common memory and does not require new() for allocating mailbox handles.
// scope resolution (::) is used to access the mailbox from the class it is instantiated in.

// This approach eliminates errors that may occur due to incorrect mailbox connections
// *********************************************************************************************


// sample class 1 
class c1;
    rand byte a ;
    rand bit [5:0] b;

    task run();
        common:: mbox.put(a);
        common:: mbox.put(b);

        $display("Data put in mailbox:\n\t a = %0d, b = %0d", a, b);
        $display("mailbox after putting data in:");
        $display("\tmbox: %p", common::mbox);
    endtask
endclass


// sample class 2
class c2;
    int c, d;

    task run();
        $display("c and d values before getting data:\n\t c = %0d, d = %0d", c, d);

    // int and byte are both integral type, the following will not result in an error
        common:: mbox.get(c);
        common:: mbox.get(d);

        $display("c and d values after getting data:\n\t c = %0d, d = %0d", c, d);
    endtask
endclass



module top;
    c1 c1_inst = new();
    c2 c2_inst = new();

    initial begin
        assert(c1_inst.randomize());
        $display("c1_inst = %p", c1_inst);
    // running task for putting data in mailbox
        c1_inst.run();

    // running task for getting data from mailbox
        c2_inst.run();
        $display("c2_inst = %p", c2_inst);

    end
endmodule