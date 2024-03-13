module structure;

// creating a struct type set that includes string, int and bit type 
    typedef struct {
        string name;
        int count;
        bit [7:0] data;
    } data_set; 
    
    // creating a queue of struct type, each element of queue can 
    // hold name, count and data respectively
    data_set data_setQ[$]; 

    initial begin
        for (int i; i < 5; i++) begin
            data_setQ[i].name = $sformatf("name_%0d", i);
            data_setQ[i].count = i;
            data_setQ[i].data = $urandom_range(100, 1000);
        end
        
        $display("data_setQ = %p", data_setQ);
        
    end
endmodule