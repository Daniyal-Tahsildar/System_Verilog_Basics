typedef enum bit [1:0]{
    GOOD = 2'b00,
    BAD,
    ILL
} pkt_type_t;

class sample;
    int a, prod;
    byte b, c;
    pkt_type_t pkt_type;
    static int total_fn_calls;

// static casting:
    function void get_pkt_type(int a, output pkt_type_t pkt_type);
        // pkt_type = a; // incorrect
        pkt_type = pkt_type_t'(a); // Correct way of static casting, converting 'a' from int to enum type
        total_fn_calls++;
    endfunction   

   function int get_product(byte b, c);
        prod = int '( b * c); // converting byte type to int type 
        return prod;
        total_fn_calls++;
   endfunction

endclass

class derived_sample extends sample;

    function void get_pkt_type(int a, output pkt_type_t pkt_type);
        super.get_pkt_type(a, pkt_type);
    endfunction   

   function int get_product(byte b, c);
        super.get_product(b,c);
        return prod;
   endfunction

endclass



module top;

    sample s_1 = new();
    sample s_2;
    derived_sample ds_1 = new();
    derived_sample ds_2 = new();
    int a, result;
    byte d1, d2;
    pkt_type_t pkt_tp;

    initial begin
        repeat (3) begin
            a = $urandom_range(0, 2);
            s_1.get_pkt_type(a, pkt_tp);
            $display("pkt type is = %0s", pkt_tp);

            d1 = $urandom_range(100, 126);
            d2 = $urandom_range(1, 10);;
            result = s_1.get_product(d1,d2);
            $display("d1 = %0d, d2 = %0d\n\t result = %0d\n", d1, d2, result);
        end
        
        $display("s_1 fields = %p", s_1);

// dynamic casting using $cast
    // As a function: returns 1 if cast is successful, otherwise returns 0
        s_2 = ds_1; // assign derived class handle to base class 
    // casting is successful only if the parent is previously pointing to the same derived object type
        result = $cast(ds_1, s_2);
        $display("result for dynamic casting = %0d\n", result);

    // As a task:
        //  the follwong will give an error
        // $cast(ds_2, s_1);
// Note:
    // In a testbench with multiple packet types, efficiency is crucial. Rather than creating separate
    // components for each packet type, it's more efficient to assign any packet to a common base packet.
    // This allows a base class object to reference the derived class packet and be cast to it when needed. 

        s_1 = ds_2;
        $cast(ds_2, s_1);
        result = ds_2.get_product(d1,d2);
        ds_2.get_pkt_type(a, pkt_tp);
        $display("ds_2 fields = %p", ds_2);

        
    end
endmodule



