
class run_test; //handle creation
  stimulus_generation stim = new();
  test_wb cmp = new();

  task run();
    fork
      stim.stimulus(); //drives signal to dut
      cmp.check_outputs(); // compares the expected and obtained output
    join
  endtask
endclass
