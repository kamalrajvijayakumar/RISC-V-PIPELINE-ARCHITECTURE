class comparison;
  typedef struct {
    bit [6:0] opcode;
    bit [4:0] rd;
    bit [2:0] funct3;
    bit [4:0] rs1;
    bit [4:0] rs2;
    bit [6:0] funct7;
  } parser_fields;

  parser_fields expected[4];

  function new();
    expected[0] = '{opcode: 7'b0110011, rd: 5'd1, funct3: 3'd0, rs1: 5'd0, rs2: 5'd1, funct7: 7'b0000000};
    expected[1] = '{opcode: 7'b0010011, rd: 5'd3, funct3: 3'd0, rs1: 5'd0, rs2: 5'd4, funct7: 7'b0000000};
    expected[2] = '{opcode: 7'b0100011, rd: 5'd2, funct3: 3'd0, rs1: 5'd1, rs2: 5'd1, funct7: 7'b0000000};
    expected[3] = '{opcode: 7'b1100011, rd: 5'd2, funct3: 3'd0, rs1: 5'd1, rs2: 5'd1, funct7: 7'b0000000};
  endfunction

  task data_comparison();
    int pass = 0, fail = 0;
    $display("\n                 STARTING COMPARISION TEST ---\n");
    for (int i = 0; i < 4; i++) begin
      #10;
      $display("Test %0d:", i);
      $display("  Actual  -> opcode: %b, rd: %d, funct3: %b, rs1: %d, rs2: %d, funct7: %b",
               opcode, rd, funct3, rs1, rs2, funct7);
      $display("  Expected-> opcode: %b, rd: %d, funct3: %b, rs1: %d, rs2: %d, funct7: %b",
               expected[i].opcode, expected[i].rd, expected[i].funct3,
               expected[i].rs1, expected[i].rs2, expected[i].funct7);

      if (opcode === expected[i].opcode &&
          rd === expected[i].rd &&
          funct3 === expected[i].funct3 &&
          rs1 === expected[i].rs1 &&
          rs2 === expected[i].rs2 &&
          funct7 === expected[i].funct7) begin
        $display("  Result: TEST %0d PASSED\n", i);
        pass++;
      end else begin
        $display("  Result: TEST %0d FAILED\n", i);
        fail++;
      end
    end
    $display("--- Parser Test Summary: %0d PASSED, %0d FAILED ---\n", pass, fail);
    $finish;
  endtask
endclass
