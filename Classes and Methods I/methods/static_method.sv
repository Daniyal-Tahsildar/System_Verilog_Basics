class static_sample;
//static properties are assigned a common memory for all instantiations
// any changes made in one instantiation are reflected on all instantiations
    static int count;
    //int count; // this will give errors if used inside satatic method

// static function can only  work on static properties    
    static function void incr_count();
        count++;
        $display("\tcount = %0d", count);
    endfunction
endclass


module top;
    //static_sample sample = new(); // new() is not required to access static methods or properties

    initial begin
    //check the initial value of count
    // static functions or methods need to be called using the class name and not the instance of class
        $display("count before function call = %0d", static_sample::count);

    //calling the incr_count static method
        repeat (3) begin
            static_sample::incr_count();
        end

    //check final value of count
        $display("count after function call = %0d", static_sample::count);
    end
endmodule