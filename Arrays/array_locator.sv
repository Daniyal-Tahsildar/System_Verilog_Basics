module top;
// **** All types of arrays declared, common array methods can be 
//      used on most of them ****

//Fixed array of string datatype, queue of string data type
    string SA[10], qs[$];
//Associative array of int datatype and index, queue of int data type
    int IA[int], qi[$];
//Associative array of bit datatype and integer iindex
    bit [8:0] bitVecAA[integer];
// bit vector
    bit [8:0] data_val;
//integer 
    integer index_val;
//integer queue
    integer index_Q[$];
//bit vector queue
    bit [8:0] valueQ[$];
//int
    int j;
//Dynamic array of integer datatype
    integer indexDA[];
//dynamic array of bit vector data type
    bit [8:0] valueDA[];

    initial begin
        for (int i = 0; i < 20;) begin
            index_val = $urandom_range(10, 40);
            data_val = $urandom_range(50, 90);
            if (!bitVecAA.exists(index_val)) begin
                bitVecAA[index_val] = data_val;  //associative array does not require new
                i++;
            end
        end

        $display("bitVecAA = %p", bitVecAA);
    //Find all items greater than 70
        valueQ = bitVecAA.find(xyz) with (xyz > 70);
        $display("valueQ with values > 70 = %p", valueQ);
    //Find all items greater than 70 and less than 80
        valueQ = bitVecAA.find(item) with (item > 70 && item < 80);
        $display("valueQ with values > 70 and value < 80 = %p", valueQ);
    //Find all index greater than 70 and less than 80
        index_Q = bitVecAA.find_index with (item > 70 && item < 80);
        $display("index_Q with values > 70 and value < 80 = %p", index_Q);
    //Find last index with specified value
        index_Q = bitVecAA.find_last_index(s) with (s == 86);
        $display("index_Q with value = 86= %p", index_Q);
    //Find first index with specified value
        index_Q = bitVecAA.find_first_index(s) with (s == 86);
        $display("index_Q with value = 86= %p", index_Q);
       

        for (int i = 0; i < 10; i++) begin
            SA[i] = $sformatf("%0d", i);
        end
        $display("SA = %p", SA);
        qs = SA.max with(item.atoi); //conver Sa array string elements from ASCI 
                                     //to integer and based on that find the max
        $display("qs for max of SA = %p", qs);
        qs = SA.min with(item.atoi);
        $display("qs for min of SA = %p", qs);
    end
endmodule