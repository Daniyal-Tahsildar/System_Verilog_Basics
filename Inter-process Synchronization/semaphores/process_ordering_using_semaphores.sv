class sample;
  
    static int count;  
    
// initializing two semaphores with 0 keys, keys will be added in tasks
    semaphore smp = new(0);
    semaphore smp_1 = new(0);
  
    task t1();
        smp.get(1);
        #1;
        $display("[TIME: %0d] task T1 running", $realtime);
        count++;
        smp_1.put(1);
    endtask
  
    task t2();
        smp.put(1);
        smp_1.get(1);
        #2;
        $display("[TIME: %0d] task T2 running", $realtime);
        count++;
    endtask
    
    task run();
        forever begin
            fork
                t1();     
                t2();
            join
        end
    endtask
endclass
  
// using two semaphores ensures that we get the following execution order:
    // T1 -> T2 -> T1 (order can be changed depending on requirements)
module tb;

    sample s = new();

    initial begin
        s.run();
    end

    initial begin
        $monitor("[TIME: %0d] count = %0d", $realtime, s.count);

        wait(s.count == 3); 
        $finish;
    end

endmodule