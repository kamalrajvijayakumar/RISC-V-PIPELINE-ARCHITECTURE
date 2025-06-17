class run_test;
  stimulus_generation sti;
  comparison cmp;

  function new();
    sti = new();
    cmp = new();
  endfunction

  task run();
    fork
      sti.stimulus();
      cmp.data_comparison();
    join
  endtask
endclass
