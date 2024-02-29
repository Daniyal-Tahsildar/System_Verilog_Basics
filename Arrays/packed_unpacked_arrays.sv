module packed_unpacked_array;

    // packed array examples:
    int intPA;
    logic [7:0] logicPA;

    // unpacked array examples:
    int intUA_1 [5];
    int intUA_2 [5]; // indexing: [0:4]
    int intUA_3 [10];
    bit [31:0] bitUA [4:0];

    initial begin
// Foreach can only be used on arrays with known sizes
        foreach (intUA_1[i]) begin
            intUA_1[i] = $urandom_range(5, 15);
        end

        $display("intUA_1 assigned values");
        $display("intUA_1 = %p\nintUA_2 = %p", intUA_1, intUA_2);

    // For unpacked arrays only whole array assignment or comparision is possible, any other operation
    // requires the use of specific indices 

        //Assigning an array to a different array is possible provided they are the same type
        intUA_2 = intUA_1;
        $display("intUA_2 assigned values of intUA_1");
        $display("intUA_1 = %p\nintUA_2 = %p", intUA_1, intUA_2);

        // The following will give an error 
            //intUA_1 = intUA_2 + 3;
        // But this will not:
        intUA_1[1] = intUA_2[1] + 3;
        $display("updated intUA_1[1]");
        $display("intUA_1 = %p\nintUA_2 = %p", intUA_1, intUA_2);

        // Similarly,the following will give an error due to different sizes of the arrays
            //intUA_3 = intUA_1;
        // But this will not:
        intUA_3[0:4] = intUA_1;
        $display("intUA_3 = %p", intUA_3);
    // Note that the remainig elements of intUA_3 are 0 since the default value for int type is 0 

    end
endmodule