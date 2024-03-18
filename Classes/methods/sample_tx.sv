class sample_tx;
    rand bit[31:0] addr;
    rand bit[31:0] data;
    rand bit wr_rd;
    rand bit[3:0] sel;

    function void print(string s = "sample_tx");
        $display(s);
        $display("\taddr = %h", addr);
        $display("\tdata = %h", data);
        $display("\twr_rd = %h", wr_rd);
        $display("\tsel = %b\n", sel);
    endfunction

// A compare function that takes in sample_tx class instance 
// and compares fields with current class instance
    function bit compare(sample_tx tx);
        if (addr == tx.addr 
        && data == tx.data 
        && wr_rd == tx.wr_rd 
        && sel == tx.sel) begin
            return 1;
        end
        else begin
            return 0; 
        end
    endfunction

    function sample_tx copy();
        sample_tx tx = new();
        tx.addr = addr;
        tx.data = data;
        tx.wr_rd = wr_rd;
        tx.sel = sel;
        return tx; 
    endfunction

    constraint sel_c{
        $onehot0(sel) == 1;
    }

endclass

module top;
    sample_tx tx1;
    sample_tx tx2;
    bit compare_bit;

    initial begin
         repeat(2) begin
            tx1 = new();
            assert(tx1.randomize());
            tx1.print("tx1");
         end
        
         tx2 = new();
         assert(tx2.randomize());
         tx2.print("tx2");
         
         compare_bit = tx1.compare(tx2);
         if (compare_bit) begin
            $display("transactions matched");
         end
         else begin
            $display("transactions mismatched");
            tx1.print("tx1 before copying");
            tx2.print("tx2 before copying");

            $display("copying tx1 to tx2");
            tx2 = tx1.copy();
            tx1.print("tx1 after copying");
            tx2.print("tx2 after copying");
         end

    end
endmodule


