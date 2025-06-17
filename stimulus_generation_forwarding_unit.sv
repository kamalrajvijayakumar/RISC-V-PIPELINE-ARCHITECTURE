class stimulus_generation;

  task stimulus();
    // Test 0: No forwarding, all regWrites 0
    rdMem = 5'd1; regWriteMem = 0;
    rdWb = 5'd2;  regWriteWb = 0;
    rs1 = 5'd3; rs2 = 5'd4;
    #10;

    // Test 1: ForwardB from Mem (rdMem == rs2)
    rdMem = 5'd4; regWriteMem = 1;
    rdWb = 5'd0;  regWriteWb = 0;
    rs1 = 5'd7; rs2 = 5'd4;
    #10;

    // Test 2: ForwardB from Wb (rdWb == rs2)
    rdMem = 5'd0; regWriteMem = 0;
    rdWb = 5'd9;  regWriteWb = 1;
    rs1 = 5'd1; rs2 = 5'd9;
    #10;

    // Test 3: ForwardA from Mem (rdMem == rs1)
    rdMem = 5'd6; regWriteMem = 1;
    rdWb = 5'd0;  regWriteWb = 0;
    rs1 = 5'd6; rs2 = 5'd0;
    #10;

    // Test 4: ForwardA from Wb (rdWb == rs1)
    rdMem = 5'd0; regWriteMem = 0;
    rdWb = 5'd3;  regWriteWb = 1;
    rs1 = 5'd3; rs2 = 5'd10;
    #10;

    // Test 5: Both ForwardA and ForwardB active
    rdMem = 5'd8; regWriteMem = 1;
    rdWb = 5'd9;  regWriteWb = 1;
    rs1 = 5'd8; rs2 = 5'd9;
    #10;
  endtask

endclass
