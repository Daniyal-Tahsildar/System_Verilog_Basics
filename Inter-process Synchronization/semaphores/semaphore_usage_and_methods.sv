// get() is a task, while put() and try_get() are functions.

module top;
    // semaphore allows multiple processes to be synchronized when resources are limited
    // it uses a key using put and get method to allocate resources to a process
    
    // new(key_count) creates a semaphore with a specified key count.
    semaphore sem = new(1); // semaphore with one key allocated
    
    int key_ready; 
    
    initial begin
        #5;
    // Acquire semaphore keys in a process. 
        sem.get(1);
        $display("[TIME: %0t] Reading memory block 1", $time);
        drv_data();
        $display("[TIME: %0t] Done reading memeory block 1", $time);
    // Return key to the semaphore
        sem.put(1);
    end

    initial begin
        #2;
        sem.get(1);
        $display("[TIME: %0t] Reading memory block 2", $time);
        drv_data();
        $display("[TIME: %0t] Done reading memeory block 2", $time);
        sem.put(1);
    end

    initial begin
        repeat (5) begin
            #5;
            key_ready = sem.try_get(1);
    // try_get() is non-blocking, this txt is always displayed
            $display("[TIME: %0t] key_ready = %0d", $time, key_ready);
            if (key_ready) sem.put(1);
        end
    end

    task drv_data();
        #10; // some delay that depicts driving data
    endtask
endmodule