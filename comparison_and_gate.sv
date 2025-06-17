class comparison;
  
  task data_comparison();
    int pass = 0, fail = 0;
    $display("+++++++++++++++++++++++++++++ENETERED AND GATE++++++++++");

    for (int i = 0; i < 10; i++) begin
      #10;

      expected = branch_exout_memout & zero_memout;

      if (and_out === expected) begin
        $display("Test %0d PASSED: Expected=%b, Got=%b", i, expected, and_out);
        pass++;
      end else begin
        $display("Test %0d FAILED: Expected=%b, Got=%b", i, expected, and_out);
        fail++;
      end
    end

    $display("SUMMARY: %0d PASSED, %0d FAILED", pass, fail);
    $finish;
  endtask

endclass
