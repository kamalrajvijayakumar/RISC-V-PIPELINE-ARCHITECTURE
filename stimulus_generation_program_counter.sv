class stimulus_generation;
  task stimulus();
    $display("Stimulus Generation STARTS!");
    #20 mux_if_out_pc_in = 64'hAAAAAAAAAAAAAAAA;
    #10 mux_if_out_pc_in = 64'h5555555555555555;
    #10 mux_if_out_pc_in = 64'h1234567890ABCDEF;
    #10 mux_if_out_pc_in = 64'h0000000000000000;
    #10 mux_if_out_pc_in = 64'h0000000000000001;
    #10;
    //$finish;
  endtask
endclass
