class stimulus_generation;

 task stimulus();
  reset = 1;
  clk = 0;
  alu_result = 64'd0;
  adder_ex_out = 64'd0;
  mux_2_out = 64'd0;
  rd = 5'd0;
  branch_exout = 0;
  memread_exout = 0;
  memtoreg_exout = 0;
  memwrite_exout = 0;
  regwrite_exout = 0;
  zero = 0;

  #5 clk = 1; #5 clk = 0;  // reset edge
  reset = 0;

  // ---------------- Test 1 ----------------
  alu_result = 64'hAAAA_BBBB_CCCC_DDDD;
  adder_ex_out = 64'h1111_2222_3333_4444;
  mux_2_out = 64'h9999_8888_7777_6666;
  rd = 5'd10;
  branch_exout = 1;
  memread_exout = 0;
  memtoreg_exout = 1;
  memwrite_exout = 0;
  regwrite_exout = 1;
  zero = 0;
  #5 clk = 1; #5 clk = 0; // inputs latched

  // ---------------- NOP Cycle ----------------
  alu_result = 64'd0;
  adder_ex_out = 64'd0;
  mux_2_out = 64'd0;
  rd = 5'd0;
  branch_exout = 0;
  memread_exout = 0;
  memtoreg_exout = 0;
  memwrite_exout = 0;
  regwrite_exout = 0;
  zero = 0;
  #5 clk = 1; #5 clk = 0;

  // ---------------- Test 2 ----------------
  alu_result = 64'h1234_5678_9ABC_DEF0;
  adder_ex_out = 64'h0000_1111_2222_3333;
  mux_2_out = 64'hFFFF_EEEE_DDDD_CCCC;
  rd = 5'd5;
  branch_exout = 0;
  memread_exout = 1;
  memtoreg_exout = 0;
  memwrite_exout = 1;
  regwrite_exout = 0;
  zero = 1;
  #5 clk = 1; #5 clk = 0;

  // ---------------- NOP Cycle ----------------
  alu_result = 64'd0;
  adder_ex_out = 64'd0;
  mux_2_out = 64'd0;
  rd = 5'd0;
  branch_exout = 0;
  memread_exout = 0;
  memtoreg_exout = 0;
  memwrite_exout = 0;
  regwrite_exout = 0;
  zero = 0;
  #5 clk = 1; #5 clk = 0;

  // ---------------- Test 3 ----------------
  alu_result = 64'h0BAD_F00D_DEAD_BEEF;
  adder_ex_out = 64'hCAFEBABE_00000000;
  mux_2_out = 64'h1234567812345678;
  rd = 5'd20;
  branch_exout = 1;
  memread_exout = 1;
  memtoreg_exout = 1;
  memwrite_exout = 1;
  regwrite_exout = 1;
  zero = 0;
  #5 clk = 1; #5 clk = 0;

  // ---------------- NOP Cycle ----------------
  alu_result = 64'd0;
  adder_ex_out = 64'd0;
  mux_2_out = 64'd0;
  rd = 5'd0;
  branch_exout = 0;
  memread_exout = 0;
  memtoreg_exout = 0;
  memwrite_exout = 0;
  regwrite_exout = 0;
  zero = 0;
  #5 clk = 1; #5 clk = 0;
endtask


endclass
