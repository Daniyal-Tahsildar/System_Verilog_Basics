module top;
    // semaphore allows multiple processes to be synchronized when resources are limited
    // it uses a key using put and get method to allocate resources to a process
    semaphore sem = new(1); // semaphore with one key allocated

    initial begin
        #5;
        sem.get(1);
        $display("Reading memory block 1 = %0t", $time);
        read_mem();
        $display("done reading memeory block 1 = %0t", $time);
        sem.put(1);
    end

    initial begin
        #2;
        sem.get(1);
        $display("Reading memory block 2 = %0t", $time);
        read_mem();
        $display("done reading memeory block 2 = %0t", $time);
        sem.put(1);
    end


    task read_mem();
        #20; // some delay that depicts reading memory
    endtask
endmodule