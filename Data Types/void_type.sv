class sample_pkt;
    rand bit [3:0] size;
    rand bit [5:0] data;

// any SV function prototype is as follows:
    // function return_data_type function_name(arguments);

// a function with void return type (returns nothing)
    function void print_all(int count); // takes an int value as input 
        $display("Printing sample_pkt fields %0d", count);
        $display("size = %0d", size);
        $display("data = %0d\n", data);
    endfunction 
endclass

module top;
    sample_pkt pkt;
    
    initial begin
        for (int i = 0; i < 3; i++) begin 
               pkt = new();
        // Following is a way of writing inline constraint, 
        // discussed in detail in class and constraints section  
               pkt.randomize() with {pkt.size inside {[2:20]};};

               pkt.print_all(i); // function has no return value
        end

    end
endmodule