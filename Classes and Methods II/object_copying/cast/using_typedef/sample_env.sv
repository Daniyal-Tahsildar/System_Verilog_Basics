class sample_env;
    sample_gen gen;
    sample_drv drv;

    function new();
        gen = new();
        drv = new();
    endfunction

    task run();
        fork // used to run processes parallel
            gen.run();
            drv.run();
        join
    endtask
endclass