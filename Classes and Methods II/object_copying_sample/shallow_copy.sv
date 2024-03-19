class sample;
    int count;
endclass

class sample_2;
    sample s = new();
    int b;
    int a;

    function void print(string st = "sample_2");
        $display(st);
        $display("\ta = %0d", a);
        $display("\tb = %0d", b);
        $display("\tsample = %p", s);

    endfunction
endclass


module top;
    sample_2 s1 = new();
    sample_2 s2 = new();

    initial begin
        s2 = new s1; //shallow copy 
        s2.a = 20;
        s1.b = 40;

        //s1 and s2 do not point to the same location in memory
        s1.print("s1");
        s2.print("s2");

        //change in one will not reflect in the other for non-objects
        s1.a = 55;
        s1.print("s1");
        s2.print("s2");

        //changing count value for s1
        s1.s.count = 50;
        // count will reflect in both s1 and s2 since its an object field
        s1.print("s1");
        s2.print("s2");
    end
endmodule