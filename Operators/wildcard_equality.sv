module wildcard_equality;
    logic [7:0] a, a2;
    logic [7:0] b;
    logic [7:0] mask;

    initial begin 

        a = 8'b1011_0101; 
        b = 8'b1011_xx01;
        $display("a = %b, b = %b", a, b);
    
    // the following can also be done using assert();
        if (a ==? b) $display("a and b match");
        else $display("a and b mismatch, result = %b", (a2 ==? b));

        mask = 8'b0x0x_0x0x;
    // masking all the even position bits using XOR, this can be done when certain 
    // positions of a variable need not be compared
        a2 = mask ^ a;
        $display("a = %b, \na2 = %b", a, a2);
        if (a ==? a2) $display("a2 and a match");
        else $display("a2 and a mismatch, result = %b", (a ==? a2));
    
    // the following evaluated to X, since the LHS has an X 
        if (b ==? a) $display("a and b match");
        else $display("a and b mismatch, result = %b", (b ==? a));

    // wildcard inequality operator works similarly
        if (a !=? a2) $display("a2 and a mismatch, result = %b", (a ==? a2));
        else $display("a2 and a match");

    end
endmodule