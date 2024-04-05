// this example demonstrates how events can be used to synchronize transactions between two class processes

// During simulation pay close attention to the 'TIME' variable is each task's display statement that
// represents when the transaction was generated and driven

class common;
    static mailbox mbox = new(); 
    static int count_tx;
endclass

// transaction class
class tx_class;
    // only a and b undergo randomization
    rand byte a ;
    rand bit [5:0] b;
    int c, d;
endclass

// generator class  
class gen;
    tx_class tx;
    event drv_event;

    function new (event e);
        drv_event = e;
    endfunction

    task run();
        forever begin
            $display("\n[TIME: %0t] gen class task for count %0d", $realtime, common::count_tx);
            tx = new();
            assert(tx.randomize());
            common::mbox.put(tx);

            $display("\tData put in mailbox :\n\t\ta = %0d, b = %0d", tx.a, tx.b);
            @(drv_event);

        // forever block resumes after @(drv_event)

//  *********************************************************************************************************
    // By using triggered(), the wait statement becomes non-blocking, allowing the task to continue executing 
    // immediately. Without the #1 delay, this task would execute continuously once the event is triggered.
    // The triggered() function remains active throughout the timestep regardless of when it was triggered 
    // within the timestep. Adding a small delay of #1 ensures that no new transactions are generated during
    // the triggered() timestep.
    // It's important to note that adding delays of this kind in a generating block is generally considered 
    // bad practice.
//  *********************************************************************************************************
            // wait(drv_event.triggered());
            // #1; // Adding a small delay to prevent continuous execution
        end
    endtask
endclass


// driver class 
class drv;
    tx_class tx;
    event drv_event;

    function new (event e);
        drv_event = e;
    endfunction

    task run();
        forever begin
            #5; // This delay represents a pause (can be a wait statement or clock edge in case of drivers)

//  *****************************************************************************************************
    // In drivers, such delays ensure that all necessary signals are properly driven and that outputs are 
    // received for the current transaction before initiating the next one.
    // This brief pause helps synchronize and stabilize the system by allowing sufficient time for signal 
    // propagation and processing.
//  *****************************************************************************************************

            $display("\n[TIME: %0t] drv class task for count %0d", $realtime, common::count_tx);
            common:: mbox.get(tx);
            $display("\tc and d values before getting data:\n\t\tc = %0d, d = %0d", tx.c, tx.d);
            tx.c = tx.a;
            tx.d = tx.b;
            $display("\tc and d values after getting data:\n\t\tc = %0d, d = %0d", tx.c, tx.d);
            common::count_tx++;
            #2;
        // triggereing the event
            -> drv_event;
        end
    endtask
endclass



module top;
    event e;
    gen gen_inst = new(e);
    drv drv_inst = new(e);

    initial begin
        // fork join is used to run process in parallel, will be discussed in the fork-join section
        fork
        // running task for putting data in mailbox
            gen_inst.run();
        // running task for getting data from mailbox
            drv_inst.run();
        join
    end
 
    initial begin
        // end simulation when transaction count reaches the specified limit
        wait (common::count_tx == 3) begin
            $display("endtime = %0t", $realtime);
            $finish;
        end
    end 
endmodule