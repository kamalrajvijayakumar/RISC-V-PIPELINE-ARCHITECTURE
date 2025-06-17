class run;
  
  stimulus_generation stim = new();
  comparison cmp = new();
  
  task run_test();
    $display("Entered Run");
    fork
      stim.stimulus();
      cmp.data_comparison();
    join_any
    wait fork;
    $display("Both tasks done. Ending simulation.");
    $finish;
    endtask
endclass
