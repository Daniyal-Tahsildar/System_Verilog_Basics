`include "intf.sv"
`include "pipline.sv"

module tb;

    logic clk;
    intf pif(.clk(clk));
    sample s1 = new(pif);
    
    initial begin
        clk = '0;
        while (1) begin
            #5 clk = ~clk;
        end
    end
    
    task reset_all();
        pif.DATA = '0;   
        pif.ADDR= '0; 
        pif.ready= '0; 
        pif.count = '0; 
    endtask
    
    
    initial begin
        reset_all();
        assert(s1.randomize());
        s1.run();
    end

    initial begin
        while (1) begin
            repeat(2) @(posedge clk);
            pif.ready = $random;
        end
    end
    
    initial begin
        wait (pif.count == 4);
        @(posedge clk);
        $finish;
    end

    initial begin
        $dumpfile("test.vcd");
        $dumpvars();
    end

endmodule