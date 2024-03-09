`define WIDTH 6

module concat_replicate;
    logic [27:0] data_1;
    logic [3:0] data_2;

    logic a1, a2, a3, a4;
    logic [1:0] a5;

    bit [7:0] a, b;
    bit [3:0] msb_int;

    string string_data_1, string_data_2;

    initial begin 
// concatenation 
        data_2 = 4'd3;

        // data_1 = {8'd11, 16'h13, 5}; // Incorrect
        data_1 = {8'd11, 16'd13, 4'd5}; // Correct
        $display("data_1 = %0d", data_1);
        data_1 = {8'd11, 16'd13, data_2}; // Possible
        $display("data_1 = %0d", data_1);

        // Concatenation can also be utilized on the left-hand side of an assignment.
        {a1, a2, a3, a4} = data_2;
        $display("a1 = %b, a2 = %b, a3 = %b, a4 = %b", a1, a2, a3, a4);
        // partial assignmnet is also possible, but the MSB bits are lost
        {a5,a4} = data_2;
        $display("a5 = %b, a4 = %b", a5, a4);

        a = 150 ; b = 50;
        msb_int = {a + b} [7: 4];  // Only the 4 most significant bits of the sum of a and b are selected
        $display("addition = %b , \n\tmsb_int = %b", (a+b), msb_int);

    // The string data type automaticaaly resizes to acomodate additional data during concatenation
        string_data_1 = "This is ";
        string_data_2 = {string_data_1, "a string"};
        $display("string_data_2 = %s\n", string_data_2);


// replication
        data_2 = {2{2'b10}};
        $display("data_2 = %b", data_2);
        data_1 = {`WIDTH{4'b1100}}; 
        // 1100 repeated `WIDTH (6) times (data_1 will 0000_1100_1100_1100_1100_1100_1100), assignment starts from LSB 
        $display("data_1 = %b", data_1);

    end
endmodule