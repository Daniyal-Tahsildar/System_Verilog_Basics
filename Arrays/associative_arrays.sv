module sample_AA;
    //declaring associative array with index type integer
    bit [8:0] bitvecAA [integer];
    bit [8:0] data;
    bit [8:0] index;
    //queues to store assosciative array index and data
    integer ind_Q[$];
    bit [8: 0] data_Q[$];
  	int count;

    initial begin
      for(int i = 0; i<10;) begin
            data = $urandom_range(50, 90);
            index = $urandom_range(10, 40);
        //for having unique values and indices
            if (!bitvecAA.exists(index)) begin
                bitvecAA[index] = data;
              i = i+1;
            end
        end
        count = bitvecAA.num();

        foreach(bitvecAA[i]) begin
            ind_Q.push_back(i);
            data_Q.push_back(bitvecAA[i]);
        end

        $display("Assosciative array: \n\tbitvecAA = %p", bitvecAA);
        $display("size of associative array: \n\tbitvecAA.num = %0d", count);
        $display("index values of assosciative array: \n\tind_Q = %p", ind_Q);
        $display("data values of associative array: \n\tdata_Q = %p", data_Q);
   	
    end
endmodule