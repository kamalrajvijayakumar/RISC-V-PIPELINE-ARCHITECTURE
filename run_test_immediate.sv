class run_test;
  stimulus_generation stim = new();
  comparison cmp = new();

  task run();
    fork
      stim.stimulus();
      cmp.data_comparison();
    join
  endtask
endclass
