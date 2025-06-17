class comparison;

  // Expected results for each test (in order)
  typedef struct {
    logic [1:0] ForwardA_exp;
    logic [1:0] ForwardB_exp;
  } exp_t;

  exp_t expected[6];

  function new();
    expected[0] = '{2'b00, 2'b00}; // No forwarding
    expected[1] = '{2'b00, 2'b10}; // ForwardB from Mem
    expected[2] = '{2'b00, 2'b01}; // ForwardB from Wb
    expected[3] = '{2'b10, 2'b00}; // ForwardA from Mem
    expected[4] = '{2'b01, 2'b00}; // ForwardA from Wb
    expected[5] = '{2'b10, 2'b01}; // Both ForwardA & ForwardB
  endfunction

  task data_comparison();
    int pass = 0, fail = 0;
    $display("++++++++++++++++++++++++++++++++++++FORWARDING UNIT++++++++++++++++++++++++++++");
    for (int i = 0; i < 6; i++) begin
      #10;
      if ((ForwardA === expected[i].ForwardA_exp) && (ForwardB === expected[i].ForwardB_exp)) begin
        $display("TEST %0d PASSED: Expected ForwardA = %b, Actual ForwardA = %b, Expected ForwardB = %b, Actual ForwardB = %b",
                 i, expected[i].ForwardA_exp, ForwardA, expected[i].ForwardB_exp, ForwardB);
        pass++;
      end else begin
        $display("TEST %0d FAILED: Expected ForwardA = %b, Actual ForwardA = %b, Expected ForwardB = %b, Actual ForwardB = %b",
                 i, expected[i].ForwardA_exp, ForwardA, expected[i].ForwardB_exp, ForwardB);
        fail++;
      end
    end
    $display("SUMMARY: %0d PASSED, %0d FAILED", pass, fail);
    $finish;
  endtask

endclass
