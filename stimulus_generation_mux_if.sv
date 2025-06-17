class stimulus_generation;
  bit [63:0] test_vectors_if [0:9];
  bit [63:0] test_vectors_ex [0:9];
  int test_idx;

  function new();
    test_vectors_if[0] = 64'h0000000000000001;
    test_vectors_if[1] = 64'h0000000000000002;
    test_vectors_if[2] = 64'h0000000000000003;
    test_vectors_if[3] = 64'h0000000000000004;
    test_vectors_if[4] = 64'h0000000000000005;
    test_vectors_if[5] = 64'hAAAAAAAAAAAAAAAA;
    test_vectors_if[6] = 64'h5555555555555555;
    test_vectors_if[7] = 64'h123456789ABCDEF0;
    test_vectors_if[8] = 64'h0FEDCBA987654321;
    test_vectors_if[9] = 64'hFFFFFFFFFFFFFFFF;

    test_vectors_ex[0] = 64'h1111111111111111;
    test_vectors_ex[1] = 64'h2222222222222222;
    test_vectors_ex[2] = 64'h3333333333333333;
    test_vectors_ex[3] = 64'h4444444444444444;
    test_vectors_ex[4] = 64'h5555555555555555;
    test_vectors_ex[5] = 64'h9999999999999999;
    test_vectors_ex[6] = 64'h8888888888888888;
    test_vectors_ex[7] = 64'h7777777777777777;
    test_vectors_ex[8] = 64'h6666666666666666;
    test_vectors_ex[9] = 64'h0000000000000000;
  endfunction

  task stimulus();
    for (test_idx = 0; test_idx < 10; test_idx++) begin
      adder_if_out_mux_if_in = test_vectors_if[test_idx];
      adder_ex_out_mux_if_in = test_vectors_ex[test_idx];
      and_out = 0;  // always select else path
      #10;
    end
  endtask
endclass
