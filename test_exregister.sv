class test_exr;

  // expected values for each test case
  typedef struct {
    logic [63:0] pcid_exout;
    logic [63:0] readdata1ex_out;
    logic [63:0] readdata2ex_out;
    logic [63:0] imm_data_exout;
    logic [4:0]  rs1_ex;
    logic [4:0]  rs2_ex;
    logic [4:0]  rd_ex;
    logic [3:0]  instruction_id_exout;
    logic        branch_exout;
    logic        memread_exout;
    logic        memtoreg_exout;
    logic        memwrite_exout;
    logic        alusrc;
    logic        regwrite_exout;
    logic [1:0]  aluop;
  } expected_out_t;

  expected_out_t expected[3];

  function new();
    expected[0] = '{
      pcid_exout           : 64'h0000_0000_0000_0000,
      readdata1ex_out      : 64'h1111_1111_1111_1111,
      readdata2ex_out      : 64'h2222_2222_2222_2222,
      imm_data_exout       : 64'hAAAA_BBBB_CCCC_DDDD,
      rs1_ex               : 5'd1,
      rs2_ex               : 5'd2,
      rd_ex                : 5'd3,
      instruction_id_exout : {1'b1, 3'b000}, // funct7[5] = 1, funct3 = 000 (SUB)
      branch_exout         : 1'b0,
      memread_exout        : 1'b0,
      memtoreg_exout       : 1'b0,
      memwrite_exout       : 1'b0,
      alusrc               : 1'b0,
      regwrite_exout       : 1'b1,
      aluop                : 2'b10
    };

    expected[1] = '{
      pcid_exout           : 64'h0000_0000_0000_1000,
      readdata1ex_out      : 64'h1234_5678_9ABC_DEF0,
      readdata2ex_out      : 64'h0000_1111_2222_3333,
      imm_data_exout       : 64'h0000_0000_0000_0004,
      rs1_ex               : 5'd4,
      rs2_ex               : 5'd5,
      rd_ex                : 5'd6,
      instruction_id_exout : {1'b0, 3'b000}, // ADDI
      branch_exout         : 1'b0,
      memread_exout        : 1'b1,
      memtoreg_exout       : 1'b1,
      memwrite_exout       : 1'b0,
      alusrc               : 1'b1,
      regwrite_exout       : 1'b1,
      aluop                : 2'b00
    };

    expected[2] = '{
      pcid_exout           : 64'h0000_0000_0000_2000,
      readdata1ex_out      : 64'hDEAD_BEEF_CAFE_BABE,
      readdata2ex_out      : 64'hFACE_C0DE_1234_5678,
      imm_data_exout       : 64'h0000_0000_0000_0010,
      rs1_ex               : 5'd7,
      rs2_ex               : 5'd8,
      rd_ex                : 5'd9,
      instruction_id_exout : {1'b0, 3'b000}, // BEQ
      branch_exout         : 1'b1,
      memread_exout        : 1'b0,
      memtoreg_exout       : 1'b0,
      memwrite_exout       : 1'b0,
      alusrc               : 1'b0,
      regwrite_exout       : 1'b0,
      aluop                : 2'b01
    };
  endfunction

  task check_outputs();
    int pass = 0, fail = 0;
    $display("+++++++++++++++++++ENTERD THE LAST BLOCK HURRAY+++++++++++++++++");
    for (int i = 0; i < 3; i++) begin
      #10;
      if (
        pcid_exout           === expected[i].pcid_exout           &&
        readdata1ex_out      === expected[i].readdata1ex_out      &&
        readdata2ex_out      === expected[i].readdata2ex_out      &&
        imm_data_exout       === expected[i].imm_data_exout       &&
        rs1_ex               === expected[i].rs1_ex               &&
        rs2_ex               === expected[i].rs2_ex               &&
        rd_ex                === expected[i].rd_ex                &&
        instruction_id_exout === expected[i].instruction_id_exout &&
        branch_exout         === expected[i].branch_exout         &&
        memread_exout        === expected[i].memread_exout        &&
        memtoreg_exout       === expected[i].memtoreg_exout       &&
        memwrite_exout       === expected[i].memwrite_exout       &&
        alusrc               === expected[i].alusrc               &&
        regwrite_exout       === expected[i].regwrite_exout       &&
        aluop                === expected[i].aluop
      ) begin
        $display("TEST %0d PASSED ", i);
        pass++;
      end else begin
        $display("TEST %0d FAILED ", i);
        fail++;
      end
    end
    $display("-------- SUMMARY --------");
    $display("PASSED: %0d", pass);
    $display("FAILED: %0d", fail);
    $finish;
  endtask

endclass
