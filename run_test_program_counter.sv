class run_test;
  task run();
    clock_generation clk_obj = new();
    reset_generation rst_obj = new();
    stimulus_generation sti_obj = new();
    comparison cmp_obj = new();

    fork
      clk_obj.clk_gen();
      rst_obj.rst_gen();
      sti_obj.stimulus();
      cmp_obj.data_comparison();
    join
  endtask
endclass
