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

    function void copy (output sample_2 s2_inst);
        //deep copy is multiple levels of shallow copy
        s2_inst = new this; // shallow copy for non-objects
        s2_inst.s = new this.s; //shallow copy for objects
    endfunction

//another way of implementing deep copy
    // function sample_2 copy ();
    //     sample_2 s2_inst;
    //     s2_inst = new this; // shallow copy for non-objects
    //     s2_inst.s = new this.s; //shallow copy for objects
    //     return s2_inst;
    // endfunction
endclass


module top;
    sample_2 s1 = new();
    sample_2 s2 = new();

    initial begin
        s2.copy(s1); //deep copy (s1 gets copied to s2) 

        //s2 = s1.copy(); for second implementation of deep copy
        s2.a = 20;
        s1.b = 40;

        //s1 and s2 do not point to the same location in memory
        s1.print("s1");
        s2.print("s2");

        //change in one will not reflect in the other
        s1.a = 55;
        s1.print("s1");
        s2.print("s2");

        //changing count value for s1
        s1.s.count = 50;
        // count will not reflect in both s1 and s2 due to deep copy
        s1.print("s1");
        s2.print("s2");
    end
endmodule