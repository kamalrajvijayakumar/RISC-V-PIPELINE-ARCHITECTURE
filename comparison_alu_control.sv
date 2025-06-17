class comparison;
  logic[3:0] expected[9];
  
  function new();
    expected[0] = 4'b0010;
    expected[1] = 4'b0110;
    expected[2] = 4'b0010;
    expected[3] = 4'b0110;
    expected[4] = 4'b0000;
    expected[5] = 4'b0001;
    expected[6] = 4'b0011;
    expected[7] = 4'b1111;
    expected[8] = 4'b1111;
  endfunction
  
  task data_comparison();
    int pass = 0, fail = 0;
    $display("+++++++++++++++++++++++++++++++++++ENTERED ALU CONTROL UNIT+++++++++++++++++");
    for (int i = 0; i < 9; i++) begin
      #1
      if (alu_control === expected[i]) begin
        $display("TEST %0d PASSED", i);
        $display("Expected: %b, Actual: %b", expected[i], alu_control);
        pass++;
      end else begin
        $display("TEST %0d FAILED", i);
        $display("Expected: %b, Actual: %b", expected[i], alu_control);
        fail++;
      end
    end
    $display("SUMMARY: %0d PASSED, %0d FAILED", pass, fail);
    $finish;
  endtask
endclass