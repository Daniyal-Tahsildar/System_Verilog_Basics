class sample_pkt;
    rand bit [3:0] size;
    rand bit [5:0] data;
endclass

//typedef is used to create user defined datatypes
typedef sample_pkt pktQ_t[$]; //queue of sample_pkt using typedef

// using pktQ_t type to create another datatype (Fixed size array 
// of 5 elements, with each element being a queue)
typedef pktQ_t pktQ_FA_t[5]; 

module top;
    pktQ_t pktQ_FA[5];
    sample_pkt pkt;
    
    initial begin
        for (int i = 0; i < 5; i++) begin // for array
            for (int j= 0; j < 3; j++) begin //for queue
               pkt = new();
               pkt.randomize();
               pktQ_FA[i].push_back(pkt);
            end
        end
        // foreach(pktQ_FA[i]) begin
        //     foreach (pktQ_FA[i][j]) begin
            foreach (pktQ_FA[i,j]) begin //better way of using foreach (instead of using two loops)
                $display("pktQ_FA[%0d][%0d] = %p", i,j, pktQ_FA[i][j]);
            end
        // end
    
    end
endmodule