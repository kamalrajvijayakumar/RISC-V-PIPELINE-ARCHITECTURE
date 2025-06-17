class test_wb;

  logic [63:0] expected_read_data [4];
  logic [63:0] expected_alu_result [4];
  logic [4:0]  expected_rd [4];
  logic        expected_regwrite [4];
  logic        expected_memtoreg [4];

  function new();
    // Expected values match the stimulus block in order

    expected_read_data[0]     = 64'h0;                      // Reset state
    expected_alu_result[0]    = 64'h0;
    expected_rd[0]            = 5'd0;
    expected_regwrite[0]      = 0;
    expected_memtoreg[0]      = 0;

    expected_read_data[1]     = 64'h1111_2222_3333_4444;
    expected_alu_result[1]    = 64'hAAAA_BBBB_CCCC_DDDD;
    expected_rd[1]            = 5'd3;
    expected_regwrite[1]      = 1;
    expected_memtoreg[1]      = 0;

    expected_read_data[2]     = 64'h9999_8888_7777_6666;
    expected_alu_result[2]    = 64'h5555_4444_3333_2222;
    expected_rd[2]            = 5'd7;
    expected_regwrite[2]      = 0;
    expected_memtoreg[2]      = 1;

    expected_read_data[3]     = 64'hDEAD_BEEF_DEAD_BEEF;
    expected_alu_result[3]    = 64'hCAFEBABE_CAFEBABE;
    expected_rd[3]            = 5'd0;
    expected_regwrite[3]      = 0;
    expected_memtoreg[3]      = 0;
  endfunction

  task check_outputs();
    int pass = 0, fail = 0;
    $display("+++++++++++++++++++++++++++++++++++++++++ENETERDE WB REGISTER++++++");

    for (int i = 0; i < 4; i++) begin
      #10;

      $display("==== Test %0d ====", i);

      if (read_data_wb_in_wbout === expected_read_data[i] &&
          alu_result_memout_wbout === expected_alu_result[i] &&
          rd_memout_wbout === expected_rd[i] &&
          regwrite_exout_memout_wbout === expected_regwrite[i] &&
          memtoreg_exout_memout_wbout === expected_memtoreg[i]) begin
        $display(" Test %0d PASSED", i);
        pass++;
      end else begin
        $display(" Test %0d FAILED", i);
        $display("Expected RD      : %h | Got: %h", expected_rd[i], rd_memout_wbout);
        $display("Expected ALU     : %h | Got: %h", expected_alu_result[i], alu_result_memout_wbout);
        $display("Expected MEM     : %h | Got: %h", expected_read_data[i], read_data_wb_in_wbout);
        $display("Expected RegWrite: %b | Got: %b", expected_regwrite[i], regwrite_exout_memout_wbout);
        $display("Expected MemToReg: %b | Got: %b", expected_memtoreg[i], memtoreg_exout_memout_wbout);
        fail++;
      end
    end

    $display("===== SUMMARY =====");
    $display("Total Passed: %0d", pass);
    $display("Total Failed: %0d", fail);
    $finish;
  endtask

endclass
