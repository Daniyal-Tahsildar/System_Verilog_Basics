module dynamic_array;
// static array declaration:
    int intSA [0:15];
// dynamic array declarations: 
    int intDA []; 
    int intDA_1[] = {1, 4, 6, 13}; // does not require new[]
    int intDA_2[];
    int intDA_3[];
    int intDA_4[];
    string stringDA [];
    bit [7:0] bitDA []; 

    int size_value;

    initial begin
        $display ("intDA_1 = %p", intDA_1);
        $display ("intDA = %p", intDA); // will print an empty array

    // allocating memory to the dynamic array,
        intDA = new[10]; // DA of size 10
        stringDA = new[10];
        bitDA = new[10]; 
    
    // assigning values to Dynamic arrays
        foreach (intDA[i]) begin
            intDA[i] = $urandom_range (10, 100);
        end

        foreach (stringDA[i]) begin
    // the $sformatf method is used for String formatting 
            stringDA[i] = $sformatf("value_%0d", i);;
        end

        $display("intDA = %p", intDA);
        $display("stringDA = %p", stringDA);

    // note that we do not require new[] in the following case
        intDA_2 = intDA; 
        $display("intDA_2 = %p", intDA_2);

        
// Dynamic array methods:
// 1.   Another way of new[]    
    // The following copies the elements of intDA to a new array intDA_3,
    // the remaining elements of intDA_3 are 0 since the data type is int 
        intDA_3 = new[20] (intDA);
        $display("intDA_3 = %p", intDA_3);

    // Similarly, only the first 5 elements of intDA are copied to intDA_4    
        intDA_4 = new[5] (intDA);
        $display("intDA_4 = %p", intDA_4);

// 2.   delete() method: deletes complete array, specific element cannot be deleted for Dynamic array: 
        intDA_4.delete(); // array_name.delete()
        $display("intDA_4 = %p", intDA_4);

// 3.   size() retrieves the size of the dynamic array, returning it as an integer value.
        size_value = intDA.size();
        $display("size of intDA = %0d", size_value);

        size_value = intDA_3.size();
        $display("size of intDA_3 = %0d", size_value);


    end
endmodule