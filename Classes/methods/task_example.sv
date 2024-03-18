// This example code demostrates how a task is capable of executing in 0 or more simulation time 

class task_sample;
    
    task inc_count (int count);
        $display("\n[before updating] time = %0t, \tcount = %0d", $realtime, count);
        if (count <= 10) begin
            #2;
            count = count + 2;
        end
        else if (count > 10 && count <= 20)begin 
            #4;
            count = count + 3;
        end
        else begin
            count = count + 10;
        end
        $display("[after updating] time = %0t, \tcount = %0d", $realtime, count);
   endtask
   
endclass

module top;
    task_sample sample = new();

    initial begin
        sample.inc_count(1);
        sample.inc_count(12);
        sample.inc_count(25);
    end
endmodule