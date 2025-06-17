class comparison;
  logic [63:0] expected[4];

  function new();
    expected[0] = 64'd0;
    expected[1] = 64'd4;
    expected[2] = 64'd17;
    expected[3] = 64'd18;
  endfunction

  task data_comparison();
    int pass = 0, fail = 0;

    $display("\n--- Starting Immediate Data Extractor Comparison Test ---\n");

    for (int i = 0; i < 4; i++) begin
      #10;
      if (imm_data === expected[i]) begin
        $display("TEST %0d PASSED", i);
        pass++;
      end else begin
        $display("TEST %0d FAILED", i);
        fail++;
      end

      $display("  Expected: %0d (0x%h)", expected[i], expected[i]);
      $display("  Actual  : %0d (0x%h)", imm_data, imm_data);
    end

    $display("\n--- Immediate Data Extractor Summary: %0d PASSED, %0d FAILED ---\n", pass, fail);
    $finish;
  endtask
endclass
