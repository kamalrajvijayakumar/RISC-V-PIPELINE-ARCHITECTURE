module adder_ex(
  input  wire [63:0] pcid_exout,
  input  wire [63:0] imm_data_exout,
  output reg  [63:0] adder_ex_out_mem_in
);

  always @(*) begin
    adder_ex_out_mem_in = pcid_exout + (imm_data_exout << 1);//left shift means multiply by 2
  end

endmodule
