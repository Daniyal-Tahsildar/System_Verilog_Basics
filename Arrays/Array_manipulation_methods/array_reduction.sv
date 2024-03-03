module array_reduction;
    // **** These can be used on all types of arrays except associative array ****

    //Associative array of bit datatype and int iindex
    bit [8:0] bitAA[int];
    //Dynamic array of int datatype
    int intDA[];
    //Fixed array of string datatype
    string string_SA[10];
    //int queue
    int int_Q[$], index_Q[$];
    //bit vector queue
    bit [8:0] value_Q[$];
    
    bit [8:0] data_val;
    bit [16:0] bit_reduction;

    int index_val;
    int data, int_reduction;
    
    initial begin

        for (int i = 0; i < 20;) begin
            index_val = $urandom_range(10, 40);
            data_val = $urandom_range(40, 80);
            if (!bitAA.exists(index_val)) begin
                bitAA[index_val] = data_val;  //associative array does not require new
                i++;
            end
        end

        // assigning the data values of bitAA to a queue
        foreach(bitAA[i]) begin
            value_Q.push_back(bitAA[i]);
        end

        $display("bitAA = %p", bitAA);
        $display("value_Q = %p", value_Q);

        // A for loop to populate int_Q with unique elements
        for(int i = 0; i < 30;) begin
            data = $urandom_range(100, 129);
            if(!(data inside {int_Q})) begin  // the inside operator has been discussed in operators section
                int_Q.push_back(data);
                i = i+1;
            end
        end

        // assigning int_Q to intDA
        intDA = int_Q;
        $display("int_Q = %p", int_Q);
        $display("intDA = %p", intDA);

        foreach (string_SA[i]) begin
        // the $sformatf method is used for String formatting 
            string_SA[i] = $sformatf("%0d", i);;
        end

        $display("string_SA = %p", string_SA);

// sum(): Returns the sum of all the array elements.
        bit_reduction = bitAA.sum();
        $display("\nbitAA sum (incorrect result) = %0d", bit_reduction);

    // NOTE: *******************************************************************
        // The result of sum() for bitAA is incorrect, this is because, the sum() method truncates
        // the result obtained to the type of the array (bit [8:0] in this case), to resolve this 
        // issue, we can use the with() clause as shown belowto forcibly extend the width of the 
        // result to accomodate additional bits

    // *************************************************************************
        bit_reduction = value_Q.sum() with (16'(item));
        $display("value_Q sum = %0d", bit_reduction);

        // sum can determined manually as follows
        bit_reduction = '0;
        foreach(value_Q[i]) begin 
            bit_reduction = bit_reduction + value_Q[i];
        end
        $display("value_Q sum, using foreach = %0d", bit_reduction);

        int_reduction = int_Q.sum();
        $display("int_Q sum = %0d", int_reduction);
        int_reduction = intDA.sum();
        $display("intDA sum = %0d", int_reduction);

// product(): Returns the product of all the array elements
    // ***changing values in all the arrays, since their product will be too large for their types,
    // resulting in out-of-bounds issues****
        // ********************************************************************
        bitAA.delete();
        value_Q = {};
        int_Q = {};
        for (int i = 0; i < 5;) begin
            index_val = $urandom_range(10, 20);
            data_val = $urandom_range(1, 10);
            if (!bitAA.exists(index_val)) begin
                bitAA[index_val] = data_val;  
                i++;
            end
        end
        foreach(bitAA[i]) value_Q.push_back(bitAA[i]);
        foreach(value_Q[i]) int_Q[i] = $urandom_range(10,30);;
        intDA = int_Q;

        $display("bitAA = %p", bitAA);
        $display("value_Q = %p", value_Q);
        $display("int_Q = %p", int_Q);
        $display("intDA = %p", intDA);
        // ********************************************************************

        bit_reduction = bitAA.product();
        $display("\nbitAA product (incorrect result) = %0d", bit_reduction);

    // NOTE: *******************************************************************
        // The result of product() for bitAA is incorrect, for the same reasons discussed in sum()
    // *************************************************************************
        bit_reduction = value_Q.product() with (16'(item));
        $display("value_Q product = %0d", bit_reduction);

        // product can determined manually as follows
        bit_reduction = {'0, 1'b1}; // initializing bit_reduction to 1
        foreach(value_Q[i]) begin 
            bit_reduction = bit_reduction * value_Q[i];
        end
        $display("value_Q product, using foreach = %0d", bit_reduction);

        int_reduction = int_Q.product();
        $display("int_Q product = %0d", int_reduction);
        int_reduction = intDA.product();
        $display("intDA product = %0d", int_reduction);

// and(): Returns the bitwise AND of all the array elements
        bit_reduction = bitAA.and();
        $display("\nbitAA AND = %0d", bit_reduction);
        bit_reduction = value_Q.and();
        $display("value_Q AND = %0d", bit_reduction);

        int_reduction = int_Q.and();
        $display("int_Q AND = %0d", int_reduction);
        int_reduction = intDA.and();
        $display("intDA AND = %0d", int_reduction);

// or(): Returns the bitwise OR of all the array elements
        bit_reduction = bitAA.or();
        $display("\nbitAA OR  = %0d", bit_reduction);
        bit_reduction = value_Q.or();
        $display("value_Q OR = %0d", bit_reduction);

        int_reduction = int_Q.or();
        $display("int_Q OR = %0d", int_reduction);
        int_reduction = intDA.or();
        $display("intDA OR = %0d", int_reduction);
// xor(): Returns the bitwise XOR of all the array elements
        bit_reduction = bitAA.xor();
        $display("\nbitAA XOR  = %0d", bit_reduction);
        bit_reduction = value_Q.xor();
        $display("value_Q XOR = %0d", bit_reduction);

        int_reduction = int_Q.xor();
        $display("int_Q XOR = %0d", int_reduction);
        int_reduction = intDA.xor();
        $display("intDA XOR = %0d", int_reduction);

    end
endmodule