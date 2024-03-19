class sample;
    int b;
    int a;

endclass


module top;
    sample s1 = new();
    sample s2 = new();

    initial begin
        s2 = s1; //copy by handle 
        s2.a = 20;
        s1.b = 40;

        //s1 and s2 point to the same location in memory
        $display("s2 = %p", s2);
        $display("s1 = %p", s1);

        //change in one will reflect in the other
        s1.a = 55;
        $display("s2 = %p", s2);
        $display("s1 = %p", s1);
    end
endmodule