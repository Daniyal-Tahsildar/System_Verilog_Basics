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

// derived class with additional arguments extended from base class. The derieved class needs to have all the parameters present on the
// base class as its parameter. The extended base class parameters are casted to the derived class as shown 
class fifo_with_name #(bit DS_TYPE = `FIFO, type DT = int, string name = "default name") extends lifo_fifo #(.DS_TYPE(DS_TYPE), .DT(DT));
    DT dataQ[$];

    function new();
        $display("*****FIFO_with_name derived class Name = %s *****", name);
    endfunction

    function void putQ(DT data);
        super.putQ(data);
       // $display("Name = %s", name);
    endfunction

    function void getQ(output DT data);
        super.getQ(data);
        //$display("Name = %s", name);
    endfunction
endclass


module top;
    // passing in parameter arguments for the derived class
    fifo_with_name #(.DS_TYPE(`FIFO), .DT(int), .name("FIFO with INT datatype")) fwn_i_1;
    fifo_with_name #(.DS_TYPE(`FIFO), .DT(byte), .name("FIFO with BYTE datatype")) fwn_i_2;
    int a, b;
    byte c, d;
    
    initial begin
        fwn_i_1 = new();
        repeat(3) begin
        // for a, b
            a = $urandom_range(100, 150);
            fwn_i_1.putQ(a);
        end
        repeat(3) begin
        // for a, b
            fwn_i_1.getQ(b);
        end

        fwn_i_2 = new();
        repeat(3) begin
            // for a, b
                c = $urandom_range(100, 150);
                fwn_i_2.putQ(c);
            end
            repeat(3) begin
            // for a, b
                fwn_i_2.getQ(d);
            end
    end
endmodule