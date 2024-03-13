module user_defined;
    // creating a new data type of 6 bits.
    typedef bit [5:0] bit_type;

    // creating enum type 
    typedef enum logic [1:0] {
        SMALL, MEDIUM, LARGE
    } enum_type;

    // creating a queue data type using an already created data type  
    typedef bit_type bit_Q_type[$]; // bit [5:0] bit_Q_type[$]
      
    bit_type bit_v;
    enum_type size_v;
    bit_Q_type bit_Q;

        initial begin
            bit_v = '1;        
            $display("bit_v = %b", bit_v);

            size_v = MEDIUM;
            $display("size_v:\n\t string: %s, int_value: %b", size_v, size_v);
    
            for (int i; i < 5; i++) begin
                bit_Q[i]  = $urandom_range(4, 100);
            end
            $display("bit_Q = %p", bit_Q);
            
        end
    endmodule

    