class comparison;
  logic [63:0] expected[4];

  function new();
    expected[0] = 64'd108;     // 100 + (4 << 1)
    expected[1] = 64'd214;     // 200 + (7 << 1)
    expected[2] = 64'd50;      // 50 + (0 << 1)
    expected[3] = 64'd990;     // 1000 + (-5 << 1)
  endfunction

  task data_comparison();
    int pass = 0, fail = 0;
    $display("++++++++++++++++ADDER ENETERD++++++++++++++"); 
    for (int i = 0; i < 4; i++) begin
      #10;
      if (adder_ex_out_mem_in === expected[i]) begin
        $display("TEST %0d PASSED", i);
        $display("Expected: %0d, Actual: %0d", expected[i], adder_ex_out_mem_in);
        pass++;
      end else begin
        $display("TEST %0d FAILED", i);
        $display("Expected: %0d, Actual: %0d", expected[i], adder_ex_out_mem_in);
        fail++;
      end
    end
    $display("SUMMARY: %0d PASSED, %0d FAILED", pass, fail);
    $finish;
  endtask
endclass
