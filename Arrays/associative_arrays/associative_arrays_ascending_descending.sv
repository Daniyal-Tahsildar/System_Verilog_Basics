module sample_AA;
// assosciative arrays behave similar to linked 
// lists and keep track of next and prev indices
    bit [8:0] bitAA [integer];
    bit [8:0] data;
    integer index;

    initial begin
      for(int i = 0; i<10;) begin
            data = $urandom_range(50, 90);
            index = $urandom_range(10, 40);
            if (!bitAA.exists(index)) begin
                bitAA[index] = data;
              i = i+1;
            end
        end
      
        $display("Associative array: \n\tbitAA = %p", bitAA);
//assending order
    //assigning the first index value to variable index (declared in line 6)
        bitAA.first(index);
        $display("##########################################");
        $display("Ascending order:");
		$display("index= %d, data = %h ", index, bitAA[index]);
    
        //keep printing values till there is no next element
        while(bitAA.next(index))begin
        $display("index= %d, data = %h ", index, bitAA[index]);
        end
        $display("##########################################");

//desending order
        bitAA.last(index);
        $display("##########################################");
        $display("Desending order:");
        $display("index= %d, data = %h ", index, bitAA[index]);
    //keep printing values till there is no prev element
        while(bitAA.prev(index))begin
            $display("index= %d, data = %h ", index, bitAA[index]);
        end
        $display("##########################################");

    end
endmodule