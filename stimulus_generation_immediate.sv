class stimulus_generation;
  task stimulus();
    instruction_idout = 32'b0000000_00010_00001_000_00011_0110011; #10;
    instruction_idout = 32'b000000000100_00001_000_00011_0010011; #10;
    instruction_idout = 32'b0000000_00011_00001_010_10001_0100011; #10;
    instruction_idout = 32'b000000_00010_00001_000_10010_1100011; #10;
  endtask
endclass
