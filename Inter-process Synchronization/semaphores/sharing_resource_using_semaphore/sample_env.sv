class sample_env;
    sample_gen gen;
    sample_drv_1 drv_1;
    sample_drv_2 drv_2;

    function new();
        gen = new();
        drv_1 = new();
        drv_2 = new();
    endfunction

    task run();
        fork // used to run processes parallel
            gen.run();
            drv_1.run();
            drv_2.run();
        join
    endtask
endclass