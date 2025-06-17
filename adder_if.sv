module adder_if(
  input  wire [63:0] pc_out_aim_in,
  output wire [63:0] adder_if_out_mux_if_in
);

  localparam [63:0] adder_if_b = 64'd4;

  assign adder_if_out_mux_if_in = pc_out_aim_in + adder_if_b;

endmodule
