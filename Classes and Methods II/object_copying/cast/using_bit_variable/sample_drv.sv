class sample_drv;
    sample_good_pkt good_pkt;
    sample_bad_pkt bad_pkt;
    sample_illegal_pkt ill_pkt;
    
    //get any pkt (good, bad, ill) as sample_pkt
    //this works due to polymorphism 
    sample_pkt pkt;    
    task run();
        repeat (10) begin
            common::gen2drv_mbox.get(pkt);
            case(pkt.pkt_b)
                0: begin
                // derived class casted from a base class (base class object casted to a derived class object)
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