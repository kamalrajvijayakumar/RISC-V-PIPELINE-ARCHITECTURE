class comparison;
  bit [63:0] expected_values[5];
  int i;

  task data_comparison();
    $display("=============================================");
    $display("ENTERED: Program Counter Test - Comparison Block");
    $display("=============================================");

    #25;

    expected_values[0] = 64'hAAAAAAAAAAAAAAAA;
    expected_values[1] = 64'h5555555555555555;
    expected_values[2] = 64'h1234567890ABCDEF;
    expected_values[3] = 64'h0000000000000000;
    expected_values[4] = 64'h0000000000000001;

    for (i = 0; i < 5; i++) begin
      #10;
      $display("[%0t] Test %0d:", $time, i);
      $display("  Expected: %h", expected_values[i]);
      $display("  Actual  : %h", pc_out_aim_in);
      
      if (pc_out_aim_in === expected_values[i])
        $display("  RESULT   : TEST %0d PASSED\n", i);
      else
        $display("  RESULT   : TEST %0d FAILED\n", i);
    end

    $display("=============================================");
    $display("Program Counter Test - Comparison Completed");
    $display("=============================================");
    $finish;
  endtask
endclass
