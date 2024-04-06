class sample_drv_1;
    sample_good_pkt good_pkt;
    sample_bad_pkt bad_pkt;
    sample_illegal_pkt ill_pkt;
    
    //get any pkt (good, bad, ill) as sample_pkt
    sample_pkt pkt;    
    task run();
        repeat (5) begin
            common::smp.get(1);
            common::gen2drv_mbox.get(pkt);
            pkt.print("sample_drv_1");
            #3; // some delay to emulate time consumption
            common::smp.put(1); 
        end
    endtask
endclass