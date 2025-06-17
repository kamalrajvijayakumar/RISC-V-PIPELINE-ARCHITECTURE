class comparison;
  bit [63:0] expected_values [0:9];
  int i;
  int pass_count;

  function new();
    $display("\n+-++-+-++-+-+-+-+-+-+-+-++-+-+-++-+-+-");
    $display("*              Entered MUX Test Comparison           *");
    $display("+++++++++++++++++++------------------+--+-+-+-+--+-++-+-+--+-+-+\n");
    
    expected_values[0] = 64'h0000000000000001;
    expected_values[1] = 64'h0000000000000002;
    expected_values[2] = 64'h0000000000000003;
    expected_values[3] = 64'h0000000000000004;
    expected_values[4] = 64'h0000000000000005;
    expected_values[5] = 64'hAAAAAAAAAAAAAAAA;
    expected_values[6] = 64'h5555555555555555;
    expected_values[7] = 64'h123456789ABCDEF0;
    expected_values[8] = 64'h0FEDCBA987654321;
    expected_values[9] = 64'hFFFFFFFFFFFFFFFF;
    pass_count = 0;
  endfunction

  task data_comparison();
    $display("\n+++++++++++++++++++ MUX COMPARISON START ===================");
    for (i = 0; i < 10; i++) begin
      #10;
      if (mux_if_out_pc_in === expected_values[i]) begin
        pass_count++;
        $display("[%0t] TEST %0d PASSED:Expected = %h, Actual = %h, Passed so far = %0d",
                 $time, i, expected_values[i], mux_if_out_pc_in, pass_count);
      end else begin
        $display("[%0t] TEST %0dFAILED: Expected = %h, Actual = %h",
                 $time, i, expected_values[i], mux_if_out_pc_in);
      end
    end
    $display("====++-======== MUX COMPARISON END ==++++++\n");
    $display("Total Passed: %0d out of 10", pass_count);
    $finish;
  endtask
endclass
