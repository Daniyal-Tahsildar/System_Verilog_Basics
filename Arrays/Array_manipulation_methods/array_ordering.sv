module array_ordering;
// **** These can be used on all types of arrays except associative array ****

//Fixed array of string datatype
    string string_SA[10];
//int queue
    int int_Q[$];
//Dynamic array of int datatype
    int intDA[];

    int data;

    initial begin
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

// sort(): Sorts the unpacked array in ascending order.
        intDA.sort();
        $display("\nintDA after sorting (ascending order) = \n\t%p", intDA);
// rsort(): Sorts the unpacked array in descending order.
        int_Q.rsort() ; 
        $display("int_Q after reverse sorting (descending order) = \n\t%p", int_Q);
// reverse(): Reverses all the elements of an array. Note that with() cannot be used with the reverse method.
        string_SA.reverse() ; 
        $display("string_SA after reversal = \n\t%p", string_SA);
// shuffle(): Randomizes the order of the elements in the array
        string_SA.shuffle() ; 
        $display("string_SA after shuffling = \n\t%p", string_SA);

    end
endmodule