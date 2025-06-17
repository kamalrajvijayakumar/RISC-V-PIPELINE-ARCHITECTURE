//`include "signals.sv"

class stimulus_generation;
  bit [6:0] test_opcodes[5] = {
    7'b0110011, // R-type
    7'b0000011, // Load
    7'b0100011, // Store
    7'b1100011, // Branch
    7'b1111111  // Invalid/Default
  };

  task stimulus();
    foreach (test_opcodes[i]) begin
      opcode = test_opcodes[i];
      $display("[%0t] Stimulus: opcode = %b", $time, opcode);
      #10;
    end
  endtask
endclass
