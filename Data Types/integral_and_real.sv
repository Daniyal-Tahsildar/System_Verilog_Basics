module int_real;
// Integral data types 
    // following data types defaults to unsigned
    bit [3:0] bit_vec;
    reg [3:0] reg_vec; // 4-state, default value is X
    logic [3:0] logic_vec; // 4-state, default value is X

    // following data types defaults to signed
    byte byte_vec;
    shortint shortint_vec;
    int int_vec;
    integer integer_vec; // 4-state, default value is X
    longint longint_vec;

    // Changing default type
    byte unsigned byte_unsign_vec;
    bit signed [3:0] bit_sign_vec;

// Real type
    shortreal shortreal_vec;
    real real_vec;

    initial begin
    // Display default values
        $display("bit_vec = %b\n reg_vec = %b\n logic_vec = %b\n", bit_vec, reg_vec, logic_vec); 
        $display("byte_vec = %b\n shortint_vec = %b\n int_vec = %b\n integer_vec = %b\n longint_vec = %b\n", byte_vec, shortint_vec, int_vec, integer_vec, longint_vec);
        $display("shortreal_vec = %b\n real_vec = %b\n", shortreal_vec, real_vec);

        byte_vec = -35;
        $display("byte_vec = %d", byte_vec); // displays -35
        byte_unsign_vec = byte_vec;
        $display("byte_unsign_vec = %d", byte_unsign_vec); // displays 221

    end
endmodule