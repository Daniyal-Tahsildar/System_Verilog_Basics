`include "pack_unpack.sv"

module top;   
    sample_pkt pkt, pkt_1, pkt_2;
    byte dataQ[$];

    initial begin
        pkt = new();
    //randomization
        assert(pkt.randomize());
    //printing
        pkt.print("sample_pkt");
    //copy pkt to pkt_1
        $display("*****Copy pkt to pkt_1*****");
        pkt.copy(pkt_1);
        pkt_1.print("sample_pkt_1");
    //compare
        $display("*****Compare pkt to pkt_1*****");
        assert(pkt.compare(pkt_1));
    //pack pkt in dataQ
        $display("*****Packing pkt into dataQ*****");
        pkt.pack(dataQ);
    //unpack dataQ to pkt_2
        pkt_2 = new();
        $display("*****Unpacking dataQ into pkt_2*****");
        pkt_2.unpack(dataQ);
        pkt_2.print("sample_pkt_2");

    //comapring again
        $display("*****Compare pkt to pkt_2*****");
        assert(pkt.compare(pkt_2));
    //printing
        pkt_1.print("sample_pkt_1");
        pkt_2.print("sample_pkt_2");
    end
endmodule