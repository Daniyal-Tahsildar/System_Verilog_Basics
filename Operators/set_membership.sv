// set set membership operator is mainly used in conditional statements (if/assert)
// or constraint blocks in classes.

// NOTE: Classes and constraints are discussed in later sections 
// forward declaration of class
typedef class sample_class;

module set_membership;
    
    int data_1, data_1Q[$];
    int data_2;
    string string_data;

    initial begin 
        for (int i = 0; i < 5; i++) begin
            data_1 = $urandom_range(5, 15);
            data_1Q.push_back(data_1);
        end  

        $display("data_1Q = %p", data_1Q);
        data_2 = 12;

        if (data_2 inside {data_1Q}) begin
            $display("data_2 is inside data_1Q");
        end
        else begin
            $display("data_2 is not inside data_1Q");
        end

        string_data = "string_1";
        if (string_data inside {"string", "str", "string_1"}) begin
            $display("string data match");
        end
        else begin
            $display("string data mismatch");
        end
    end

    sample_class s_class;
    initial begin
        repeat (5) begin
            s_class = new();
            assert(s_class.randomize());
            $display("class_data = %0d", s_class.class_data);
        end
    end
endmodule

class sample_class;
    rand int class_data;

    // when inside is used in constraints, it restricts the values a variable can take  
    constraint data_c {
        class_data inside {2, 5, [40: 50]};
    }
endclass