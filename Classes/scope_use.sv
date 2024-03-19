// closest declared variable/method takes precedence

int count = 40; //Global scope: outside class and module

class sample;
    integer count = 30; // class scope
endclass

module top;
    
    int count = 20; // module scope
    sample s = new();

    initial begin : L1
        int count = 10; // initial scope (L1 label)

        $display("Count values in: \n\tinitial block = 10, \n\t module = 20 \n\t class = 30 \n\t global = 40");

        $display("\n\tAccess count in initial block, count = %0d", count);

        $display("\tAccess count in module using $root, count = %0d", $root.top.count);
    // *****Following can also be used for module level access*****
        $display("\tAccess count in module, count = %0d", top.count);

        $display("\tAccess count in sample class, count = %0d", s.count);
    //*****Following can also be used for class level access*****
        $display("\tAccess count in sample class, count = %0d", top.s.count);

        $display("\tAccess count in global scope using $unit, count = %0d", $unit::count);
    end

    initial begin: L2
    //Changing L1 count value in this intial block
        #5; // delay to prevent race condition while displaying
        $display("\n*****L2 initial block*****");
        $display("\tAccess count in initial block L1, count = %0d", L1.count);
        L1.count = 50;
        $display("\tInitial block L1 count value after change, count = %0d", L1.count);
    end

endmodule