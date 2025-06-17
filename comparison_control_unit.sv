class comparison;
  typedef struct {
    bit alu_src;
    bit mem_to_reg;
    bit reg_write;
    bit mem_read;
    bit mem_write;
    bit branch;
    bit [1:0] alu_op;
  } control_signals_t;

  control_signals_t expected[5];
  int pass_count = 0;

  function  new();
    expected[0] = '{alu_src:0, mem_to_reg:0, reg_write:1, mem_read:0, mem_write:0, branch:0, alu_op:2'b10}; // R-type
    expected[1] = '{alu_src:1, mem_to_reg:1, reg_write:1, mem_read:1, mem_write:0, branch:0, alu_op:2'b00}; // Load
    expected[2] = '{alu_src:1, mem_to_reg:0, reg_write:0, mem_read:0, mem_write:1, branch:0, alu_op:2'b00}; // Store (mem_to_reg corrected to 0)
    expected[3] = '{alu_src:0, mem_to_reg:0, reg_write:0, mem_read:0, mem_write:0, branch:1, alu_op:2'b01}; // Branch
    expected[4] = '{alu_src:0, mem_to_reg:0, reg_write:0, mem_read:0, mem_write:0, branch:0, alu_op:2'b00}; // Default
  endfunction

  task data_comparison();
    $display("=============================================");
    $display("Control Unit Test - Comparison Block");
    $display("=============================================");
    pass_count = 0;

    for (int i = 0; i < 5; i++) begin
      #10;
      $display("[%0t] Checking output for test %0d", $time, i);
      $display("Expected => ALU_SRC=%0b MEM2REG=%0b REGW=%0b MEMRD=%0b MEMWR=%0b BRANCH=%0b ALUOP=%02b",
               expected[i].alu_src, expected[i].mem_to_reg, expected[i].reg_write,
               expected[i].mem_read, expected[i].mem_write, expected[i].branch, expected[i].alu_op);
      $display("Actual   => ALU_SRC=%0b MEM2REG=%0b REGW=%0b MEMRD=%0b MEMWR=%0b BRANCH=%0b ALUOP=%02b",
               alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op);

      if (alu_src === expected[i].alu_src &&
          mem_to_reg === expected[i].mem_to_reg &&
          reg_write === expected[i].reg_write &&
          mem_read === expected[i].mem_read &&
          mem_write === expected[i].mem_write &&
          branch === expected[i].branch &&
          alu_op === expected[i].alu_op) begin
        $display("TEST %0d PASSED\n", i);
        pass_count++;
      end else begin
        $display("TEST %0d FAILED\n", i);
      end
    end

    $display("Total Tests Passed: %0d / 5", pass_count);
    $finish;
  endtask
endclass
