
class eth_gen;
    eth_good_pkt good_pkt;
    eth_bad_pkt bad_pkt;
    eth_ill_pkt ill_pkt;
    bit [1:0] pkt_b; 
    //mailbox gen2bfm_mbox = new();

    task run();
        repeat (10) begin
            pkt_b = $urandom_range(0, 2);   
            case (pkt_b) 
                0: begin
                    good_pkt = new();
                    assert(good_pkt.randomize() with {good_pkt.pkt_b == 0;});
                    eth_common::gen2bfm_mbox.put(good_pkt);
                end
                1: begin
                    bad_pkt = new();
                    assert(bad_pkt.randomize()with {bad_pkt.pkt_b == 1;});
                    eth_common::gen2bfm_mbox.put(bad_pkt);
                end
                2: begin
                    ill_pkt = new();
                    assert(ill_pkt.randomize()with {ill_pkt.pkt_b == 2;});
                    eth_common::gen2bfm_mbox.put(ill_pkt);
                end
            endcase
        end

    endtask
    

endclass