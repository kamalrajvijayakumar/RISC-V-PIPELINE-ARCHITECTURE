class comparison;
  task data_comparison();
    int pass = 0, fail = 0;
    logic [63:0] a, b;
    logic [63:0] abar, bbar;
    logic [63:0] mux1out, mux2out;
    logic [63:0] andOut, orOut, sumOut;
    logic [63:0] expected_result;
    logic        expected_zero;

    for (int i = 0; i < 10; i++) begin
      #11;

      a = mux_1_out_alu_in;
      b = mux_ex_out_alu_in;
      abar = ~a;
      bbar = ~b;

      mux1out = (ALUOp[3]) ? abar : a;
      mux2out = (ALUOp[2]) ? bbar : b;

      andOut = mux1out & mux2out;
      orOut  = mux1out | mux2out;
      sumOut = mux1out + mux2out;

      case (ALUOp[1:0])
        2'b00: expected_result = andOut;
        2'b01: expected_result = orOut;
        2'b10: expected_result = sumOut;
        default: expected_result = 64'd0;
      endcase

      expected_zero = (expected_result == 64'd0);

      if ((Result === expected_result) && (zero === expected_zero)) begin
        $display("TEST %0d PASSED", i);
        $display("  ALUOp     = %b", ALUOp);
        $display("  Inputs    = A: %h, B: %h", a, b);
        $display("  Expected  = Result: %h, zero: %b", expected_result, expected_zero);
        $display("  Actual    = Result: %h, zero: %b", Result, zero);
      end else begin
        $display("TEST %0d FAILED", i);
        $display("  ALUOp     = %b", ALUOp);
        $display("  Inputs    = A: %h, B: %h", a, b);
        $display("  Expected  = Result: %h, zero: %b", expected_result, expected_zero);
        $display("  Actual    = Result: %h, zero: %b", Result, zero);
        fail++;
      end
    end

    $display("SUMMARY: %0d PASSED, %0d FAILED", 10 - fail, fail);
    $finish;
  endtask
endclass
