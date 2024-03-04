module queue;
    // queue declaration:
    int intQ_1[$: 29]; // queue with a max size of 30 elements, stores int type data 
    int intQ_2[$: 29]; 
    string stringQ[$: 5]; // queue with a max size of 6 elements, stores string type data 
    
    int data;
    string string_data;
    int Q_size;

    initial begin
// for an empty queue, foreach cannot be used
        for (int i; i < 10; i++) begin
            data = $urandom_range(10, 500);


// putting data in the queue can be done using push_back() and push_front()
            intQ_1.push_back(data);
            intQ_2.push_front(data);
        end

        $display("First data put in queue is at first index position in queue: \n\tintQ_1 = %p", intQ_1);
        $display("First data put in queue is at last index position in queue: \n\tintQ_2 = %p", intQ_2);

        
// Accesing data from the queue can be done using pop_front() or pop_back(), these methods retrive data
// from the queue while also deleting it
        data = intQ_2.pop_front();
        $display("First data in queue intQ_2 is retrived: \n\tdata = %0d\n\tintQ_2 = %p", data, intQ_2);
        data = intQ_1.pop_back();
        $display("Last data in queue intQ_1 is retrived: \n\tdata = %0d\n\tintQ_1 = %p", data, intQ_1);


        for (int i; i < 3; i++) begin
            string_data = $sformatf("string_data_%0d", i);;
            stringQ.push_back(string_data);
        end

        $display("String data in queue: \n\tstringQ = %p", stringQ);
        

// insering elements in a queue can be done using Q_name.insert(index-position, data);
        stringQ.insert(1, "inserted_data");
        $display("String queue after data insertion: \n\tstringQ = %p", stringQ);
    //*** If a queue has hit the maximum storage limit, data cannot be inserted, the insert() operation returns the 
    // queue as it is with a "Queue operation would exceed max" warning ***


// Elements in a queue can be reversed using the Q_name.reverse() method
        stringQ.reverse();
        $display("String queue after reversing: \n\tstringQ = %p", stringQ);


// the elements in a queue can be shuffled using the Q_name.shuffle() method
        stringQ.shuffle();
        $display("String queue after shuffling: \n\tstringQ = %p", stringQ);


// queue elements can be deleted at specific index location or the entire queue can be deleted
    // For specific index location, use Q_name.delete(index-position)
        stringQ.delete(1);
        $display("String queue after deletion at specific index: \n\tstringQ = %p", stringQ);
    // For entire queue, there are two ways:
        // 1.    use Q_name.delete()
        stringQ.delete();
        $display("String queue after deletion: \n\tstringQ = %p", stringQ);
        // 2.    use Q_name = {} -> rewrites the queue as empty
        intQ_2 = {};
        $display("IntQ_2 queue after deletion: \n\tintQ_2 = %p", intQ_2);


// size() retrieves the size of the queue, returning it as an integer value.
        Q_size = intQ_1.size();
        $display("IntQ_1 size = %0d", Q_size);
        Q_size = stringQ.size();
        $display("stringQ size = %0d", Q_size);

    end
endmodule