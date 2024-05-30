class sample;
    bit [5:0] DATA, ADDR;  
    bit[5:0] count;
    virtual intf vif;

    // semaphore is used to control the pipeline addr phase
    semaphore lock;

  
    function new(virtual intf vif);
    	this.vif = vif;
        lock = new(1);
    endfunction
  
  
    task update ();
        @(posedge vif.clk);
        lock.get(1);
            // This delay illustrates addr_phase taking (repeat(n)) cycles to complete 
            repeat(1) @(posedge vif.clk);
            vif.ADDR <= this.ADDR++;
            $display("[TIME: %0t] ADDR updated to %0d, vif.ready = %0d", $realtime, ADDR, vif.ready);

            // A port signal to indicate that the DUT is ready to take in the next tx
            wait (vif.ready == 1);
            // @(posedge vif.clk);
            
        lock.put(1);
        
         // This delay illustrates addr_phase taking (repeat(n)) cycles to complete 
        repeat(1) @(posedge vif.clk);
        vif.DATA <= this.DATA++;
        $display("[TIME: %0t] DATA updated to %0d, vif.ready = %0d", $realtime, DATA, vif.ready);

        wait (vif.ready == 1);

        @(posedge vif.clk);

        
    
    endtask
  

    task reset_values();
        DATA <= 0;   
        ADDR <= 0; 
    endtask

    task run();
        forever begin
            for(int i = 0; i < 5; i++) begin
                fork
                    update();
                join_none
            end
            
            // wait for all forks to complete 
            wait fork;

            // update count (count represents total pipelined transactions generated, 
            // sequencer/ generator is responsible for this, but for clarity, is done 
            // here in the example)
            vif.count <= this.count++;
            $display("[TIME: %0t] Count updated to %0d", $realtime, count);

            // reset values once all tasks in fork are done
            reset_values();
        end
    endtask
  

endclass