class stimulus_generation;
  bit [63:0] test_vectors [0:9];
  int test_idx;

  function new();
    test_vectors[0] = 64'h0000000000000000;
    test_vectors[1] = 64'd10;
    test_vectors[2] = 64'hFFFFFFFFFFFFFFFC;
    test_vectors[3] = 64'h123456789ABCDEF0;
    test_vectors[4] = 64'h00000000000000FF;
    test_vectors[5] = 64'hAAAAAAAAAAAAAAAA;
    test_vectors[6] = 64'h5555555555555555;
    test_vectors[7] = 64'h0000000000000001;
    test_vectors[8] = 64'h7FFFFFFFFFFFFFFF;
    test_vectors[9] = 64'h8000000000000000;
    test_idx = 0;
  endfunction

  task stimulus();
    for (test_idx = 0; test_idx < 10; test_idx++) begin
      pc_out_aim_in = test_vectors[test_idx];
      #10;  
    end
  endtask
endclass
