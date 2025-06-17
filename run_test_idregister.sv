class run_test;
  stimulus_generation stim = new();
  test_idr cmp = new();

  task run();
    fork
      stim.stimulus();
      cmp.check_outputs();
    join
  endtask
endclass
