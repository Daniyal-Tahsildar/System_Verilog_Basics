
class sample_gen;
    sample_good_pkt good_pkt;
    sample_bad_pkt bad_pkt;
    sample_illegal_pkt ill_pkt;
    bit [1:0] pkt_b; 
    pkt_type_t pkt_t;

    //mailbox gen2drv_mbox = new();

    task run();
        // generate 10 packets
        repeat (10) begin
            pkt_b = $urandom_range(0, 2);   
            case (pkt_b) 
                0: begin
                    good_pkt = new();
                    assert(good_pkt.randomize() with {good_pkt.pkt_t == GOOD;});
                    common::gen2drv_mbox.put(good_pkt);
                end
                1: begin
                    bad_pkt = new();
                    assert(bad_pkt.randomize()with {bad_pkt.pkt_t == BAD;});
                    common::gen2drv_mbox.put(bad_pkt);
                end
                2: begin
                    ill_pkt = new();
                    assert(ill_pkt.randomize()with {ill_pkt.pkt_t == ILL;});
                    common::gen2drv_mbox.put(ill_pkt);
                end
            endcase

    // The following can also be done 

            // pkt_b = $urandom_range(0, 2);  
            // pkt_t = pkt_type_t '(pkt_b); 
            // case (pkt_t) 
            //     GOOD: begin
            //         good_pkt = new();
            //         assert(good_pkt.randomize() with {good_pkt.pkt_t == GOOD;});
            //         common::gen2drv_mbox.put(good_pkt);
            //     end
            //     BAD: begin
            //         bad_pkt = new();
            //         assert(bad_pkt.randomize()with {bad_pkt.pkt_t == BAD;});
            //         common::gen2drv_mbox.put(bad_pkt);
            //     end
            //    ILL: begin
            //         ill_pkt = new();
            //         assert(ill_pkt.randomize()with {ill_pkt.pkt_t == ILL;});
            //         common::gen2drv_mbox.put(ill_pkt);
            //     end
            // endcase
        end

    endtask
endclass