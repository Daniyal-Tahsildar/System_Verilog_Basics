module strings;
    string s1, s2, s3, s4;
    int count, compare_v, return_v;
    real return_v_real;

    initial begin

        s1 = "This is   string";
        $display("s1 = %s", s1);

    // Returns length of the string
        count = s1.len();
        $display("count = %0d", count);

    // Replaces a character in a string: string_name.putc(index-position, character) 
        s1.putc(8, "a");
        $display("s1 = %s", s1);

    // strings can be assigned to another string
        s2 = s1;
        $display("s2 = %s", s2);
    
    // converts the strring to uppercase
        s3 = s2.toupper();
        $display("s3 = %s", s3);

    // compares two strings: string_1.compare(string_2)
        // returns 0 since both the strings are identical
        compare_v = s2.compare(s1);
        $display("compare_v = %0d", compare_v);
        // Will return a positive value since uppercase characters come before lowercase (lower value)
        compare_v = s2.compare(s3);
        $display("compare_v = %0d", compare_v);

    // compares two strings and is case insensitive: string_1.icompare(string_2)
        // returns 0 since both the strings are identical if case is ignored
        compare_v = s2.icompare(s3);
        $display("compare_v, ignoring cases = %0d", compare_v);

    // return ASCII value of a character at specific index-position: string_name.getc(index-position)
        return_v = s2.getc(5);
        $display("return_v, for getc() = %0d", return_v);

        s4 = "1234.5";

    // returns the real number corresponding to the ASCII decimal representation in the string
        return_v_real = s4.atoreal();
        $display("return_v_real = %0.3f", return_v_real);

    // returns the integer corresponding to the ASCII decimal representation in string
        return_v = s4.atoi();
        $display("return_v = %0d", return_v);

    // stores the ASCII decimal representation of integer in string
        s4.itoa(2345.6);
        $display("s4 = %s", s4);

    end
endmodule