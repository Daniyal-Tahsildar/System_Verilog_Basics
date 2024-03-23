class sample;
// Global constant: class properties are initialized with a fixed value  as part of their
// declaration, they cannot be assigned a value anywhere other than in their declaration.
    const int count = 2; 

// Instance constant: do not include an initial value in their declaration, they 
// can be assigned a value at runtime, but this assignment can only occur once.
    const int size;     
    
    function new(int size);
        this.size = size;
    endfunction
endclass



module top;
   
    sample s1 = new(4);
    sample s2 = new(8);

    initial begin
        $display("s1 = %p", s1);
        $display("s2 = %p", s2);

    // the following will give an error 
        // s1.count = 5;

    end
endmodule


