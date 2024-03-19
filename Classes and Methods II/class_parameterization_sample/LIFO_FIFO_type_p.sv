`define LIFO 1
`define FIFO 0
`define PRINT_FORMAT "int" //for efficient printing

//parameterizing the class to take in arguments
// since 'bit' is used DS_TYPE is a value parameterization
// 'type' keyword is used for type parameterization
class lifo_fifo #(bit DS_TYPE = `LIFO, type DT = int);
    DT dataQ[$];

    function void putQ(DT data);
        dataQ.push_back(data);
        $display("Data put into queue");
        if (`PRINT_FORMAT == "string") $display("\tData = %s", data);
        else $display("\tData = %0d", data);
    endfunction

    function void getQ(output DT data);
        // depending on DS_TYPE, this function behaves as FIFO or LIFO
        if (DS_TYPE == `LIFO) data = dataQ.pop_back;
        if (DS_TYPE == `FIFO) data = dataQ.pop_front;
        $display("Data poped out of queue");
        
        if (`PRINT_FORMAT == "string") $display("\tData = %s", data);
        else $display("\tData = %0d", data);
    endfunction
endclass

module top;
    // passing in parameter arguments
    lifo_fifo lf_i = new(); // Default arguments are taken
    //lifo_fifo #(.DS_TYPE(`FIFO), .DT(byte)) lf_i = new();
    //lifo_fifo #(.DS_TYPE(`FIFO), .DT(string)) lf_i = new();
    int a, b;
    byte c, d;
    string e, f;

    initial begin
        repeat(3) begin
        // for a, b
            a = $urandom_range(100, 150);
            lf_i.putQ(a);

        // for c, d
            // c = $urandom_range(100, 150);
            // lf_i.putQ(c);
        //end

        // for e, f
        // for (int i = 0; i< 3; i++) begin
            // e = $sformatf("this is e[%0d]", i);
            // lf_i.putQ(e);
        end

        repeat(3) begin
        // for a, b
            lf_i.getQ(b);

        // for c, d
            // lf_i.getQ(d);

        end

        // for e, f
        // for (int i = 0; i< 3; i++) begin
        //     lf_i.getQ(f);
        // end
    end

endmodule
