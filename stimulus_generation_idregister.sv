class stimulus_generation;

  task stimulus();
    // Apply reset
    reset = 1;
    clk = 0;
    pc_out_aim_in = 64'd0;
    instruction = 32'd0;
    #5; clk = 1; #5; clk = 0;  // Clock cycle with reset
    reset = 0;

    // Test 1
    pc_out_aim_in = 64'h00000000000000A0;
    instruction = 32'hDEADBEEF;
    #5; clk = 1; #5; clk = 0;

    // Test 2
    pc_out_aim_in = 64'h00000000000000F4;
    instruction = 32'h12345678;
    #5; clk = 1; #5; clk = 0;

  endtask

endclass
