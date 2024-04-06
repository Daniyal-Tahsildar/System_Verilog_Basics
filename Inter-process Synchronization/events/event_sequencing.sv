// EDA Playground issue: wait_order isn't functioning as it should   
// when used with Mentor Questa, using Synopsys VCS is recommended   

module top;
        event e1, e2, e3;
    initial begin
        // wait(e1.triggered()); 
        @(e1);
        $display("Process_2");
        -> e2;
    end
    
    initial begin
        @(e3);
        $display("Process_4");
    end
    
    initial begin
        $display("Without using event the order will be: \n\t Process_2 -> Process_4 -> Process_1 -> Process_3");
        $display("Process_1");
        -> e1;
    end
    
    initial begin
        @(e2);
        $display("Process_3");
        -> e3; 
    end

    initial begin
        wait_order(e1, e2, e3);
        // the following will give a run time error
        // wait_order(e1, e3, e2);
    end
    endmodule