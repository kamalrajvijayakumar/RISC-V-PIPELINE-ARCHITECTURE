class test_mr;

  logic [63:0] exp_alu_result     [3];
  logic [63:0] exp_adder_ex_out   [3];
  logic [63:0] exp_mux_2_out      [3];
  logic [4:0]  exp_rd             [3];
  logic        exp_branch         [3];
  logic        exp_memread        [3];
  logic        exp_memtoreg       [3];
  logic        exp_memwrite       [3];
  logic        exp_regwrite       [3];
  logic        exp_zero           [3];

  function new();
    exp_alu_result[0]   = 64'b0;
    exp_adder_ex_out[0] = 64'b0;
    exp_mux_2_out[0]    = 64'b0;
    exp_rd[0]           = 5'b0;
    exp_branch[0]       = 0;
    exp_memread[0]      = 0;
    exp_memtoreg[0]     = 0;
    exp_memwrite[0]     = 0;
    exp_regwrite[0]     = 0;
    exp_zero[0]         = 0;
    
    exp_alu_result[1]   = 64'hAAAA_BBBB_CCCC_DDDD;
    exp_adder_ex_out[1] = 64'h1111_2222_3333_4444;
    exp_mux_2_out[1]    = 64'h9999_8888_7777_6666;
    exp_rd[1]           = 5'd10;
    exp_branch[1]       = 1;
    exp_memread[1]      = 0;
    exp_memtoreg[1]     = 1;
    exp_memwrite[1]     = 0;
    exp_regwrite[1]     = 1;
    exp_zero[1]         = 0;

    exp_alu_result[2]   = 64'h1234_5678_9ABC_DEF0;
    exp_adder_ex_out[2] = 64'h0000_1111_2222_3333;
    exp_mux_2_out[2]    = 64'hFFFF_EEEE_DDDD_CCCC;
    exp_rd[2]           = 5'd5;
    exp_branch[2]       = 0;
    exp_memread[2]      = 1;
    exp_memtoreg[2]     = 0;
    exp_memwrite[2]     = 1;
    exp_regwrite[2]     = 0;
    exp_zero[2]         = 1;

    
  endfunction

  task check_outputs();
    int pass = 0, fail = 0;

    for (int i = 0; i < 3; i++) begin
      #12; // Allow pipeline to settle after stimulus change

      $display("\nChecking Test Case %0d...", i);
      if (alu_result_memout      === exp_alu_result[i]     &&
          adder_ex_out_mem_out   === exp_adder_ex_out[i]   &&
          mux_2_out_memout       === exp_mux_2_out[i]      &&
          rd_memout              === exp_rd[i]             &&
          branch_exout_memout    === exp_branch[i]         &&
          memread_exout_memout   === exp_memread[i]        &&
          memtoreg_exout_memout  === exp_memtoreg[i]       &&
          memwrite_exout_memout  === exp_memwrite[i]       &&
          regwrite_exout_memout  === exp_regwrite[i]       &&
          zero_memout            === exp_zero[i]) begin
        $display(" Test %0d PASSED", i);
        pass++;
      end else begin
        $display(" Test %0d FAILED", i);
        $display("  alu_result         : Expected = %h, Got = %h", exp_alu_result[i], alu_result_memout);
        $display("  adder_ex_out       : Expected = %h, Got = %h", exp_adder_ex_out[i], adder_ex_out_mem_out);
        $display("  mux_2_out          : Expected = %h, Got = %h", exp_mux_2_out[i], mux_2_out_memout);
        $display("  rd                 : Expected = %0d, Got = %0d", exp_rd[i], rd_memout);
        $display("  branch             : Expected = %0b, Got = %0b", exp_branch[i], branch_exout_memout);
        $display("  memread            : Expected = %0b, Got = %0b", exp_memread[i], memread_exout_memout);
        $display("  memtoreg           : Expected = %0b, Got = %0b", exp_memtoreg[i], memtoreg_exout_memout);
        $display("  memwrite           : Expected = %0b, Got = %0b", exp_memwrite[i], memwrite_exout_memout);
        $display("  regwrite           : Expected = %0b, Got = %0b", exp_regwrite[i], regwrite_exout_memout);
        $display("  zero               : Expected = %0b, Got = %0b", exp_zero[i], zero_memout);
        fail++;
      end
    end

    $display("\n===== TEST SUMMARY =====");
    $display(" %0d Passed |  %0d Failed", pass, fail);
    $finish;
  endtask

endclass
