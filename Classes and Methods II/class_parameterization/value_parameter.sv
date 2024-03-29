`define LIFO 1
`define FIFO 0

//parameterizing the class to take in arguments
// since 'bit' is used DS_TYPE is a value parameterization
class lifo_fifo #(bit DS_TYPE = `LIFO);
    int dataQ[$];

    function void putQ(int data);
        dataQ.push_back(data);
    endfunction

    function void getQ(output int data);
        // depending on DS_TYPE, this function behaves as FIFO or LIFO
        if (DS_TYPE == `LIFO) data = dataQ.pop_back;
        if (DS_TYPE == `FIFO) data = dataQ.pop_front;
        $display("Data poped out of queue");
        $display("\tData = %0d", data);
    endfunction
endclass



module top;
    // passing in parameter arguments by name
    lifo_fifo #(.DS_TYPE(`FIFO)) lf_obj = new();

    // passing in parameter arguments by position
    // lifo_fifo #(`FIFO) lf_obj = new();

    int a, b;

    initial begin
        repeat(3) begin
            a = $urandom_range(100, 150);
        // Pushing data in  
            lf_obj.putQ(a);
            $display("\ta = %0d", a);
        end

        repeat(3) begin
        // poping data 
            lf_obj.getQ(b);
        end

    end
endmodule