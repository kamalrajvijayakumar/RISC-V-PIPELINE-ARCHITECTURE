module and_gate(
  input wire branch_exout_memout,
  input wire zero_memout,
  output wire and_out
);

  assign and_out = branch_exout_memout & zero_memout;  // bitwise AND

endmodule
