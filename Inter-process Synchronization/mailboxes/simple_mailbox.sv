// sample class 1 
class c1;
    rand byte a;
    rand bit [5:0] b;

// creating a mailbox for c1
    mailbox mbox_c1 = new();

// using new() to connect mailboxes 
    function new(mailbox mbox);
        mbox_c1 = mbox;
    endfunction

    task run();
    // put(data) is used to put data in mailbox
        mbox_c1.put(a);
        mbox_c1.put(b);
        $display("Data put in mailbox:\n\t a = %0d, b = %0d", a, b);
    endtask
endclass


// sample class 2
class c2;
    byte c;
    bit [5:0] d;

// creating a mailbox for c2
    mailbox mbox_c2 = new();

// using new() to connect mailboxes 
    function new(mailbox mbox);
        mbox_c2 = mbox;
    endfunction

    task run();
        $display("c and d before getting data from mailbox:\n\t c = %0d, d = %0d", c, d);
    // get(ref_data) is used to get data from mailbox
        mbox_c2.get(c);
        mbox_c2.get(d);
        $display("c and d after getting data from mailbox:\n\t c = %0d, d = %0d", c, d);
    endtask
endclass



module top;

// creating a mailbox in higher level component and passing handle to class instances,
    mailbox mbox = new();
    c1 c1_inst = new(mbox);
    c2 c2_inst = new(mbox);
// mbox_c1 and mbox_c2 are now pointing to the same mailbox  

    initial begin
        assert (c1_inst.randomize());
        $display("c1_inst = %p", c1_inst);

    // running task for putting data in mailbox
        c1_inst.run();

    // running task for getting data from mailbox
        c2_inst.run();
        $display("c2_inst = %p", c2_inst);

    end
endmodule