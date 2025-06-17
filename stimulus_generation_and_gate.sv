class stimulus_generation;
  
  task stimulus();
    for (int i = 0; i < 10; i++) begin
      branch_exout_memout = $urandom_range(0, 1);
      zero_memout = $urandom_range(0, 1);

      //$display("Stimulus %0d: branch_exout_memout=%b, zero_memout=%b", i, branch_exout_memout, zero_memout);

      #10;
    end
  endtask

endclass
