module sample_Q;
    int intQ[$: 29]; // queue with a max size of 30 elements, stores int type data 
    int intDA[];    // dynamic array of int type
    int intQ_2[$:9];
    int number, data;

    initial begin
    // Dynamic arrays require memory allocation using the new() keyword,
        intDA = new[10];  
        foreach(intDA[i]) begin
            intDA[i] = $urandom_range(100, 200);
        end

    // A for loop to populate intQ with unique elements
        for(int i = 0; i < 30;) begin
            number = $urandom_range(100, 129);
            if(!(number inside {intQ})) begin  // the inside operator has been discussed in operators section
                intQ.push_back(number);
            //$display("number = %d" , number);
                i = i+1;
            end
        end

    //assigning intDA to intQ_2
        intQ_2 = intDA;
      
        $display("intQ = %p" , intQ);
        $display("intDA = %p" , intDA);
        $display("intQ_2 = %p" , intQ_2);
        data = intQ_2.pop_front(); // poping the first data from the queue
        $display("data = %0d" , data);
        $display("intQ_2 = %p" , intQ_2);

        $display("reversing intQ_2");
        intQ_2.reverse();
        
        $display("intQ_2 after reverse = %p" , intQ_2);
      
//poping at specific location from queue and then deleting the element
        $display("Poping at specific location, current size = %0d", intQ_2.size());
        data = intQ_2[5];
        intQ_2.delete(5);

        $display("data that was poped = %0d" , data);
        $display("intQ_2 after poping = %p" , intQ_2);
        $display("\tsize of intQ_2 after poping = %0d" , intQ_2.size());
    end
endmodule