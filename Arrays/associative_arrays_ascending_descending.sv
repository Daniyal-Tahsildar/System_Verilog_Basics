module sample_AA;
// assosciative arrays behave similar to linked 
// lists and keep track of next and prev indices
    reg [8:0] bitvecAA [integer];
    reg [8:0] data;
    integer index;

    initial begin
      for(int i = 0; i<10;) begin
            data = $urandom_range(50, 90);
            index = $urandom_range(10, 40);
            if (!bitvecAA.exists(index)) begin
                bitvecAA[index] = data;
              i = i+1;
            end
        end
      
        $display("Associative array: \n\tbitvecAA = %p", bitvecAA);
//assending order
    //assigning the first index value to variable index (declared in line 6)
        bitvecAA.first(index);
        $display("##########################################");
        $display("Ascending order:");
		$display("index= %d, data = %h ", index, bitvecAA[index]);
    //keep printing values till there is no next element
        while(bitvecAA.next(index))begin
        $display("index= %d, data = %h ", index, bitvecAA[index]);
        end
        $display("##########################################");

//desending order
        bitvecAA.last(index);
        $display("##########################################");
        $display("Desending order:");
        $display("index= %d, data = %h ", index, bitvecAA[index]);
    //keep printing values till there is no prev element
        while(bitvecAA.prev(index))begin
            $display("index= %d, data = %h ", index, bitvecAA[index]);
        end
        $display("##########################################");

    end
endmodule