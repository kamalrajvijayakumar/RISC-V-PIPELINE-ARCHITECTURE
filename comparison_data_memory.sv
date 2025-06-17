//comparison.sv
class comparison;
  
  logic [31:0] written[3];
  
  function new();
    written[0] = 32'b10101010101010101010101010101010;
    written[1] = 32'b01010101010101010101010101010101;
    written[2] = 32'b11111111111111110000000000000000;
  endfunction
  
  
  task data_comparison();
    
    int pass = 0, fail = 0;
    $display("++++++++++++++++++++DATA MEMORY BLOCK++++++++++++++");
    for (int i = 0; i < 3; i++) begin
      #20;
      $display("%b",read_data_out_mux5_1_in); 
      if (read_data_out_mux5_1_in === written[i]) begin
        $display("TEST %0d PASSED", i);
        $display("Expected: %b, Actual: %b", written[i], read_data_out_mux5_1_in);
        pass++;
      end else begin
        $display("TEST %0d FAILED", i);
        $display("Expected: %h, Actual: %h", written[i], read_data_out_mux5_1_in);
        fail++;
      end
    end
    $display("SUMMARY: %0d PASSED, %0d FAILED", pass, fail);
    
  endtask
  
endclass