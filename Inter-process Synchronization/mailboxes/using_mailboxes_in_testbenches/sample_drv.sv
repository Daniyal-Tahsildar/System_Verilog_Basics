class sample_drv;
    sample_good_pkt good_pkt;
    sample_bad_pkt bad_pkt;
    sample_illegal_pkt ill_pkt;
    
    //get any pkt (good, bad, ill) as sample_pkt
    sample_pkt pkt;    
    task run();
        repeat (10) begin
            common::gen2drv_mbox.get(pkt);
            pkt.print();
        end

    endtask
endclass