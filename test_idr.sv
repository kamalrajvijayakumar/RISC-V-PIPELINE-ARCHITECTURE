class test_idr;
  logic [63:0] expected_pc    [3];
  logic [31:0] expected_instr [3];

  function new();
    expected_pc[0]     = 64'h0000000000000000;
    expected_instr[0]  = 32'h00000000;

    expected_pc[1]     = 64'h00000000000000A0;
    expected_instr[1]  = 32'hDEADBEEF;

    expected_pc[2]     = 64'h00000000000000F4;
    expected_instr[2]  = 32'h12345678;
  endfunction

  task check_outputs();
    int pass = 0, fail = 0;
    $display("++++++++++++++++++++++++++++++++ID REGISTER++++++++++");

    for (int i = 0; i < 3; i++) begin
#10;
      $display("==== Test %0d ====", i);
      if (pcid_out === expected_pc[i] &&
          instruction_idout === expected_instr[i]) begin
        $display("Test %0d PASSED", i);
        pass++;
      end else begin
        $display("Test %0d FAILED", i);
        $display("Expected PC        : %h | Got: %h", expected_pc[i], pcid_out);
        $display("Expected Instruction: %h | Got: %h", expected_instr[i], instruction_idout);
        fail++;
      end
    end

    $display("===== SUMMARY =====");
    $display("Passed: %0d | Failed: %0d", pass, fail);
    $finish;
  endtask

endclass
