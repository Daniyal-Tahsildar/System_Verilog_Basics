module sample_AA;
//declaring associative array
  int wildcardAA[*]; // //data type: int, index type: int (default for wildcard: [*]) 
  bit [8:0] bitAA [integer]; //data type: bit[8:0], index type: integer
  int intAA[string]; //Uses string type index.

  bit [8:0] data;
  bit [8:0] index;
  int count;

  bit [8:0] index_first_next, index_last_prev;


  //queues to store assosciative array index and data
  integer ind_Q[$];
  bit [8: 0] data_Q[$];

  initial begin
// foreach cannot be used on associative arrays, unless user assigns indices and values to it
    for(int i = 0; i<10;) begin
      data = $urandom_range(50, 90);
      index = $urandom_range(10, 40);

    //for having unique values and indices
// AA_name.exists(index-value): Checks if an element exists at a given index
      if (!bitAA.exists(index)) begin
        bitAA[index] = data;
        i = i+1;
      end
    end

// AA_name.num() returns the size of the associative array
    count = bitAA.num();
    // count = bitAA.size(); // can also be used

  // adding data and index values into queues
    foreach(bitAA[i]) begin
      ind_Q.push_back(i);
      data_Q.push_back(bitAA[i]);
    end

    $display("Assosciative array: \n\tbitAA = %p", bitAA);
    $display("size of associative array: %0d", count);
    $display("index values of assosciative array: \n\tind_Q = %p", ind_Q);
    $display("data values of associative array: \n\tdata_Q = %p", data_Q);

//######################################################
  // methods first(), last(), next() and prev() are discussed here

    // AA_name.first(index_name): Returns the first index value in the array and assigns it to index_name.
    bitAA.first(index_first_next);
    $display("\nfirst index = %0d", index_first_next);

    // AA_name.last(index_name): Returns the last index value in the array and assigns it to index_name.
    bitAA.last(index_last_prev);
    $display("last index = %0d", index_last_prev);

    // AA_name.next(index_name): Returns the next index value in the array for a given index_name.
    bitAA.next(index_first_next);
    $display("next index after first index (moves left to right)= %0d", index_first_next);

    // AA_name.prev(index_name): Returns the previous index value in the array for a given index_name.
    bitAA.prev(index_last_prev);
    $display("previous index before last index (moves right to left) = %0d\n", index_last_prev);

//######################################################

  // delete(): deletes specific elements or the complete associative array
    // deleting specific elements: AA_name.delete(index-value), if the index 
    // does not exists, no element is deleted
    bitAA.delete(23);
    $display("Assosciative array after specific element is deleted: \n\tbitAA = %p", bitAA);

    // deleting entire array: AA_name.delete(),
    bitAA.delete();
    $display("Assosciative array after deletion: \n\tbitAA = %p", bitAA);
    

  end
endmodule