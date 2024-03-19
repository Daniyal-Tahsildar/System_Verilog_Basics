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
            pkt.print();
        end

    endtask
endclass