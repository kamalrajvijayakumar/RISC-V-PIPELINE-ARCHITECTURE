class comparison;
  bit [63:0] expected_values [0:9];

  function new();
    expected_values[0] = 64'h0000000000000004;
    expected_values[1] = 64'h000000000000000E;
    expected_values[2] = 64'h0000000000000000;
    expected_values[3] = 64'h123456789ABCDEF5;
    expected_values[4] = 64'h0000000000000103;
    expected_values[5] = 64'hAAAAAAAAAAAAAAAE;
    expected_values[6] = 64'h5555555555555559;
    expected_values[7] = 64'h0000000000000005;
    expected_values[8] = 64'h8000000000000003;
    expected_values[9] = 64'h8000000000000004;
  endfunction

  task data_comparison();
    $display("===++++++++++++++++ Entered the Adder Test Block ++++++++++++++===");
    for (int i = 0; i < 10; i++) begin
      #10;
      $display("[%0t] Checking output for test %0d", $time, i);
      if (adder_if_out_mux_if_in === expected_values[i]) begin
        $display("TEST %0d PASSED", i);
      end else begin
        $display("TEST %0d FAILED: Expected %h, Got %h", 
                 i, expected_values[i], adder_if_out_mux_if_in);
      end
    end
    $finish;
  endtask
endclass
