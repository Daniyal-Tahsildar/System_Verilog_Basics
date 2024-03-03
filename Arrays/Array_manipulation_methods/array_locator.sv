module array_locator;
// **** Common array methods can be used on most of the arrays declared here ****

//Fixed array of string datatype, queue of string data type
    string string_SA[10], string_Q[$];
//Associative array of int datatype and index, queue of int data type
    int intAA[int], qi[$];
//Associative array of bit datatype and integer iindex
    bit [8:0] bitAA[integer];
//integer queue
    integer index_Q[$];
    int index_Q2[$];
//bit vector queue
    bit [8:0] value_Q[$];
//Dynamic array of integer datatype
    integer indexDA[];
//dynamic array of bit vector data type
    bit [8:0] valueDA[];

// bit vector
    bit [8:0] data_val;
//integer 
    integer index_val;

    initial begin
        for (int i = 0; i < 20;) begin
            index_val = $urandom_range(10, 40);
            data_val = $urandom_range(50, 90);
            if (!bitAA.exists(index_val)) begin
                bitAA[index_val] = data_val;  //associative array does not require new
                i++;
            end
        end

        $display("bitAA = %p", bitAA);

// *** All the following methods require a with() clause, not using with() will cause an error ***

// Find all items greater than 70, can be done using find() along with the with() clause
        value_Q = bitAA.find(xyz) with (xyz > 70);
        $display("value_Q with values > 70 = \n\t%p", value_Q);

// Find all items greater than 70 and less than 80
        value_Q = bitAA.find(item) with (item > 70 && item < 80);

// NOTE: **************************************************************************************
    // The following two variations also work for any of the methods, since "item" is the default name of 
    // the argument passed in: 
        // value_Q = bitAA.find() with (item > 70 && item < 80);
        // value_Q = bitAA.find with (item > 70 && item < 80);

    // if any other argument name is used, it would cause an error, for example
        // value_Q = bitAA.find with (xyz > 70 && xyz < 80); // would cause an error, while
        // value_Q = bitAA.find(xyz) with (xyz > 70 && xyz < 80); // will not
// *******************************************************************************************

        $display("value_Q with values > 70 and value < 80 = \n\t%p", value_Q);

// Find all items with values equal to their index
        // updating bitAA with a specific value
        bitAA[14] = 14;
        value_Q = bitAA.find(item) with (item == item.index);
        $display("value_Q with elements equal to their index value = \n\t%p", value_Q);

// Find the first element divisible by 3
        value_Q = bitAA.find_first(item) with (item % 3 == 0);
        $display("value_Q with the first element divisible by 3 = %p", value_Q);

// Find the last element divisible by 3
        value_Q = bitAA.find_last(item) with (item % 3 == 0);
        $display("value_Q with the last element divisible by 3 = %p", value_Q);

// Find all elements greater than 70 and less than 80, find_index() returns the index position 
        index_Q = bitAA.find_index with (item > 70 && item < 80);
        $display("index_Q with values > 70 and value < 80 = \n\t%p", index_Q);

// updating bitAA with a specific value
        bitAA[12] = 86; // bitAA has two elements as 86 at different index positions
        $display("bitAA after an element is added = \n\t%p", bitAA);

// Find last index with specified value, find_last_index() returns the last index position with the specified value
        index_Q = bitAA.find_last_index(s) with (s == 86);
        $display("Last index with value = 86 = %p", index_Q);

// Find first index with specified value
        index_Q = bitAA.find_first_index(s) with (s == 86);
        $display("First index with value = 86 = %p", index_Q);

       
// *** For the following methods a with() clause is optional ***

// Return all elements with unique values
        value_Q = bitAA.unique();
        $display("value_Q with unique values = \n\t%p", value_Q);

// Return all indices with unique values
        index_Q = bitAA.unique_index();
        $display("index_Q with indices of unique values = \n\t%p", index_Q);


    // updating string_SA
        for (int i = 0; i < 10; i++) begin
            string_SA[i] = $sformatf("%0d", i);
        end
        $display("string_SA = \n\t%p", string_SA);

// The maximum value in the array can be determined using array_name.max()
        string_Q = string_SA.max() with(item.atoi); //convert string_SA array string elements from ASCI 
                                     //to integer (atoi) and based on that find the max
        $display("string_Q for max of string_SA = %p", string_Q);

// The minimum value in the array can be determined using array_name.max()
        string_Q = string_SA.min() with(item.atoi);
        $display("string_Q for min of string_SA = %p", string_Q);

// Using shuffle() and find_index() method on a static array of string type
        string_SA.shuffle();
        $display("string_SA = \n\t%p", string_SA);
        index_Q2 = string_SA.find_index(item) with(item == "3"); 
        $display("string_Q with index of 3 = %p", index_Q2);

    end
endmodule