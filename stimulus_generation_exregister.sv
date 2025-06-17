class stimulus_generation;

  task stimulus();
    // Wait before starting
    #5;
    
    // Test Case 0
    pcid_out         = 64'h0000_0000_0000_0000;
    readdata1ex      = 64'h1111_1111_1111_1111;
    readdata2ex      = 64'h2222_2222_2222_2222;
    imm_data         = 64'hAAAA_BBBB_CCCC_DDDD;
    rs1              = 5'd1;
    rs2              = 5'd2;
    rd               = 5'd3;
    instruction_idout = 32'b0100000_00010_00001_000_00011_0110011; // R-type SUB
    branch           = 1'b0;
    memread          = 1'b0;
    memtoreg         = 1'b0;
    memwrite         = 1'b0;
    alusrc_in        = 1'b0;
    regwrite         = 1'b1;
    aluop_in         = 2'b10;
    #10;

    // Test Case 1
    pcid_out         = 64'h0000_0000_0000_1000;
    readdata1ex      = 64'h1234_5678_9ABC_DEF0;
    readdata2ex      = 64'h0000_1111_2222_3333;
    imm_data         = 64'h0000_0000_0000_0004;
    rs1              = 5'd4;
    rs2              = 5'd5;
    rd               = 5'd6;
    instruction_idout = 32'b000000000100_00100_000_00110_0010011; // I-type ADDI
    branch           = 1'b0;
    memread          = 1'b1;
    memtoreg         = 1'b1;
    memwrite         = 1'b0;
    alusrc_in        = 1'b1;
    regwrite         = 1'b1;
    aluop_in         = 2'b00;
    #10;

    // Test Case 2
    pcid_out         = 64'h0000_0000_0000_2000;
    readdata1ex      = 64'hDEAD_BEEF_CAFE_BABE;
    readdata2ex      = 64'hFACE_C0DE_1234_5678;
    imm_data         = 64'h0000_0000_0000_0010;
    rs1              = 5'd7;
    rs2              = 5'd8;
    rd               = 5'd9;
    instruction_idout = 32'b0000000_01000_00111_000_00000_1100011; // B-type BEQ
    branch           = 1'b1;
    memread          = 1'b0;
    memtoreg         = 1'b0;
    memwrite         = 1'b0;
    alusrc_in        = 1'b0;
    regwrite         = 1'b0;
    aluop_in         = 2'b01;
    #10;
  endtask

endclass
