module top;
    event e1, e2, e3, e4;

    initial begin
        // merging events: assigning e2 event to e3
        e3 = e2;
    end

    initial begin: Process_2
        wait(e1.triggered()); 
        #2;
        $display("[TIME: %0t] Process_2", $realtime);
        // triggereing e2
        -> e2;
    end
    
    initial begin: Process_4
        @(e3);
        $display("[TIME: %0t] Process_4\n\ttriggereing e2 is same as triggereing e3, hence this block gets executed before process_3", $realtime);
    end
    
    initial begin: Process_1
        $display("[TIME: %0t] Process_1", $realtime);
        #1;
        -> e1;
    end
    
    initial begin: Process_3
        @(e2);
        #3;
        $display("[TIME: %0t] Process_3", $realtime);
        -> e3; 
    end

// assigning null to events
    initial begin
        #8;
        e4 = e2;
        $display("[TIME: %0t] Assigning e2 = null", $realtime);
        #1;
        e2 = null; // will make e3 and e4 null as well
        -> e4;
    end

    initial begin: Process_5
        @(e4);
        // the following will not execute since e4 is null
        $display("[TIME: %0t] Process_5\n\t", $realtime);
    end
endmodule