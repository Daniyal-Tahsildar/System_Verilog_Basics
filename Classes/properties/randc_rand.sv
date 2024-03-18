class rand_check;
// ranc variable: all possible values are generated before repetition starts
    randc bit [2:0] a;
// rand variable:
    rand bit [2:0] b;

endclass

module top;
    rand_check check = new();

    initial begin
        repeat(10) begin
            // check = new();  doing this here will assign a new memory everytime. 
            // This will cause randc not to take effect
            assert(check.randomize());
            $display("%p", check);
        end

// randomization can be disabled or enabled using rand_mode
        // disabling randomization
        check.a.rand_mode(0);
        check.b.rand_mode(0);
        $display("After disabling randomization for a and b");
        repeat(5) begin
            assert(check.randomize());
            $display("%p", check);
        end

        // enabling randomization
        check.a.rand_mode(1);
        check.b.rand_mode(1);
        $display("After enabling randomization for a and b");
        repeat(5) begin
            assert(check.randomize());
            $display("%p", check);
        end
    end
endmodule