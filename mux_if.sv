module mux_if (
  input  wire [63:0] adder_if_out_mux_if_in,
  input  wire [63:0] adder_ex_out_mux_if_in,
  input  wire        and_out,
  output reg  [63:0] mux_if_out_pc_in
);

  always @(*) begin
    if (and_out)
      mux_if_out_pc_in = adder_ex_out_mux_if_in;//no branching so always use else part
    else
      mux_if_out_pc_in = adder_if_out_mux_if_in;
  end

endmodule
