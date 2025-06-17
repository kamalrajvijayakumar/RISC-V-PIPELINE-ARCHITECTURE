class run_test;
  stimulus_generation stim_obj = new();
  comparison cmp_obj = new();

  task run();
    fork
      stim_obj.stimulus();
      cmp_obj.data_comparison();
    join
  endtask
endclass
