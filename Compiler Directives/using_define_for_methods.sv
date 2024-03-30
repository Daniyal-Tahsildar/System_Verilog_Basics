`define NEW function new(int b = 2, int d = 4); \
    this.b = b; \
    this.d = d; \
endfunction

class sample;
    int b, d;
    `NEW
    // The above one line substitutes the entire following function:
    // function new(int b = 2, int d = 4); 
    //     this.b = b; 
    //     this.d = d; 
    // endfunction
endclass


module top;
  sample s = new(5, 6);

    initial begin 
        $display("s = %p", s);
    end
endmodule