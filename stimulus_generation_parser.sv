class stimulus_generation;
  bit [31:0] instructions[4] = '{
    32'b00000000000100000000000010110011,
    32'b00000000010000000000000110010011,
    32'b00000000000100001000000100100011,
    32'b00000000000100001000000101100011
  };

  task stimulus();
    foreach (instructions[i]) begin
      instruction_idout = instructions[i];
      #10;
    end
  endtask
endclass
