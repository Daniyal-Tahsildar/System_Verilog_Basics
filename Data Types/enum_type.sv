module enum_type;
// enum with default values, starts from 0,1,2..
    enum bit [1:0] { SMALL_1, MEDIUM_1, LARGE_1}size_t1;

// enum with specific values assigned
    enum bit [1:0] {
        SMALL_2 = 2'b11,
        MEDIUM_2 = 2'b01,
        LARGE_2 = 2'b10
    } size_t2;
    
// enum with only first element value specified, and without a bounded size
    enum  {
        SMALL_3 = 4,
        MEDIUM_3,  // value is 5
        LARGE_3    // value is 6
    } size_t3;

    // instantiating a variable to store enum value 
    int size_v;

    initial begin
        size_v = MEDIUM_1;
        $display("size_v for MEDIUM_1 = %0d", size_v);

        size_v = SMALL_2;
        $display("size_v for SMALL_2 = %0d", size_v);

        size_v = LARGE_3;
        $display("size_v for LARGE_3 = %0d", size_v);

    end
endmodule