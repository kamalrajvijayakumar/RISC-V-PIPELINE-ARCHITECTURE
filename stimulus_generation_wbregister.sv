class stimulus_generation;

  task stimulus();
    // Test 0: Reset behavior check
    reset = 1;
    clk = 0;
    #5 clk = ~clk; 
    #5 clk = ~clk; // Rising edge with reset
    reset = 0;

    // Test 1: ALU result selected (memtoreg = 0), regwrite enabled
    read_data_wb_in         = 64'h1111_2222_3333_4444;
    alu_result_memout       = 64'hAAAA_BBBB_CCCC_DDDD;
    rd_memout               = 5'd3;
    regwrite_exout_memout   = 1;
    memtoreg_exout_memout   = 0;
    #5 clk = ~clk; #5 clk = ~clk;

    // Test 2: Memory data selected (memtoreg = 1), regwrite disabled
    read_data_wb_in         = 64'h9999_8888_7777_6666;
    alu_result_memout       = 64'h5555_4444_3333_2222;
    rd_memout               = 5'd7;
    regwrite_exout_memout   = 0;
    memtoreg_exout_memout   = 1;
    #5 clk = ~clk; #5 clk = ~clk;

    // Test 3: Both control signals disabled (simulate NOP)
    read_data_wb_in         = 64'hDEAD_BEEF_DEAD_BEEF;
    alu_result_memout       = 64'hCAFEBABE_CAFEBABE;
    rd_memout               = 5'd0;
    regwrite_exout_memout   = 0;
    memtoreg_exout_memout   = 0;
    #5 clk = ~clk; #5 clk = ~clk;

    // Test 4: Full pass through with write-back enabled and memory-to-reg active
    read_data_wb_in         = 64'h0123_4567_89AB_CDEF;
    alu_result_memout       = 64'h0F0F_0F0F_0F0F_0F0F;
    rd_memout               = 5'd31;
    regwrite_exout_memout   = 1;
    memtoreg_exout_memout   = 1;
    #5 clk = ~clk; #5 clk = ~clk;
  endtask

endclass
