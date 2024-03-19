class eth_env;
    eth_gen gen;
    eth_bfm bfm;

    function new();
        gen = new();
        bfm = new();
    endfunction

    task run();
        fork // used to run processes parallel
            gen.run();
            bfm.run();
        join
    endtask
endclass