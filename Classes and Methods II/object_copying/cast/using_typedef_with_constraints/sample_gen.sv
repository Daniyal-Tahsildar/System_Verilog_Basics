
class sample_gen;
    sample_good_pkt good_pkt;
    sample_bad_pkt bad_pkt;
    sample_illegal_pkt ill_pkt;
    bit [1:0] pkt_b; 

    //mailbox gen2drv_mbox = new();

    task run();
        repeat (10) begin
            pkt_b = $urandom_range(0, 2);   
            case (pkt_b) 
                0: begin
                    good_pkt = new();
    // no need to add in-line constraints since constraints 
    // are already added in derieved class
                    assert(good_pkt.randomize()); 
                    common::gen2drv_mbox.put(good_pkt);
                end
                1: begin
                    bad_pkt = new();
                    assert(bad_pkt.randomize());
                    common::gen2drv_mbox.put(bad_pkt);
                end
                2: begin
                    ill_pkt = new();
                    assert(ill_pkt.randomize());
                    common::gen2drv_mbox.put(ill_pkt);
                end
            endcase
        end

    endtask
endclass