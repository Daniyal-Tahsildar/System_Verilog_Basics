class eth_bfm;
    eth_good_pkt good_pkt;
    eth_bad_pkt bad_pkt;
    eth_ill_pkt ill_pkt;
    
    //get any pkt (good, bad, ill) as eth_pkt
    //this works due to polymorphism 
    eth_pkt pkt;    
    task run();
        repeat (10) begin
            eth_common::gen2bfm_mbox.get(pkt);
            case(pkt.pkt_b)
                0: begin
                    $cast(good_pkt, pkt);
                    good_pkt.print();
                end
                1: begin
                    $cast(bad_pkt, pkt);
                    bad_pkt.print();
                end
                2: begin
                    $cast(ill_pkt, pkt);
                    ill_pkt.print();
                end
            endcase
        end

    endtask
endclass