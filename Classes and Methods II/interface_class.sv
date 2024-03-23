
// the following are two interface classes and can only contain pure virtual tasks/functions
// and parameter/type declarations, they do not include any other properties or methods within its definition 
interface class push_in #(type DATA_T = logic);
    pure virtual function void put_data(DATA_T data);
endclass

interface class pop_out #(type POP_T = logic);
    pure virtual function POP_T get_data();
endclass


// Usage of Interface Classes:
// classes can implement one or more interface classes using the implements keyword (use comma (,) 
// to separate multiple interface classes that are inherited from). 
class fifo #(type D_T = logic, int DEPTH = 1) implements push_in#(D_T), pop_out#(D_T);
    D_T fifo_mem [$:DEPTH-1];
    D_T d_out;

    virtual function void put_data(D_T data); 
    // function void put_data(D_T data); can also be used if this class will not be inherited. 
        fifo_mem.push_back(data);
    endfunction

    virtual function D_T get_data();
        d_out = fifo_mem.pop_front();
	    return d_out;
    endfunction
endclass



module top;
    byte data, data_out;
// fifo object creation 
    fifo #(byte, 3) fifo_obj = new();
    initial begin
        repeat (3) begin
            data = $urandom_range(5, 100);
            fifo_obj.put_data(data);
        end

        $display("fifo_obj = %p", fifo_obj);

        repeat (3) begin
            data_out = fifo_obj.get_data();
            $display("data_out = %0d", data_out);
        end

    end
endmodule
