// This example demonstrates the use of `ifdef and `ifndef compiler directives.
// Typically, macros are defined in a shared header file accessible throughout
// the source code. Depending on which macro is defined, different code blocks
// are executed using `ifdef and `ifndef. It's important to note that the utility
// of `ifdef and `ifndef extends beyond test environments;they can also be 
// effectively utilized in design implementations.

`define __M1__
`define __M2__
`define __M3__

class sample;
    // using `ifdef
    `ifdef __M1__
        int a = 3;
        int b = 5;
    `elsif __M2__ 
        int a = 7;
        int b = 10;
    `else 
        int a = 12;
        int b = 15;
    `endif 

    `ifndef __M3__
        int c = 17;
        int d = 18;
    `else
        int c = 22;
        int d = 25;
    `endif

endclass


module top;
  sample s = new();

    initial begin 
        $display("s = %p", s);
        // prints: s = '{a:3, b:5, c:22, d:25}
    end
endmodule