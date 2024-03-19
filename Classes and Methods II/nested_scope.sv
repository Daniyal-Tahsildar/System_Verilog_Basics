class sample_1;
    static int count;
    typedef enum {
        GOOD = 2,
        BAD,
        ILL
    }pkt_type_t;

    class sample_2; // nested class 1
        class sample_3; // nested class 2
            static int count;
            typedef enum {
                GOOD = 10,
                BAD,
                ILL
            }pkt_type_t;
            static pkt_type_t pkt_type;

            function void set_count(int count);
                this.count = count;
            endfunction
        endclass // nested class 2
    endclass // nested class 1

    extern static function void print ();

endclass

function void sample_1::print ();  // scope resolution is used for extern functions
    //empty function, functionality canbe added
endfunction

module top;
    sample_1::sample_2::sample_3 s_obj = new();
    sample_1::pkt_type_t pkt_type_2; // typedefs can be accessed using scope resolution as well

    initial begin
        s_obj.pkt_type = sample_1::sample_2::sample_3::GOOD;
        $display("s_obj.pkt_type = %0d", s_obj.pkt_type); // possible since s_obj is already declared

        pkt_type_2 = sample_1::BAD;
        $display("sample_1::pkt_type = %0d", pkt_type_2); 

        s_obj.set_count(100);
        $display("s_obj::count = %0d", sample_1::sample_2::sample_3::count); //accessing count in sample_3 class
            
        sample_1::count = 200;
        $display("sample_1::count = %0d", sample_1::count); //accessing count in sample_1 class

    end
endmodule