// parameterized macro
`define WIDTH 16
// multi-line macro defined using \
`define  SHOW_DATA \
	$display("data_1 = %0d", data_1); \
	$display("data_2 = %0d", data_2); \
	$display("data_3 = %0d", data_3);  

// without default values
`define  AB_VAL1(a, b) $display("AB_VAL1: a = %0d, b = %0d", a, b);
// with default values
`define  AB_VAL2(a=5, b=1) $display("AB_VAL2: a = %0d, b = %0d", a, b);



module top;
    bit [`WIDTH-1:0] data_1, data_2, data_3;

    initial begin
        $display("WIDTH = %0d", `WIDTH);
        data_1 = `WIDTH'd12;
        data_2 = `WIDTH'd14;
        data_3 = `WIDTH'd16;

        `SHOW_DATA

    // undefining `SHOW_DATA macro 
        `undef SHOW_DATA
    // executing the following line will now give an error 
        // `SHOW_DATA

// Macros with arguments:
        `AB_VAL1(3,6);
    // following will give an error 
        // `AB_VAL1();

    // default values are selected, no error
        `AB_VAL2();
    // Argument values are selected
        `AB_VAL2(7, 8);

    end
endmodule