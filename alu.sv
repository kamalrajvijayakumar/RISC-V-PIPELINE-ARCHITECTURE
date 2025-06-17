module alu(
  input wire [63:0] mux_1_out_alu_in,
  input wire [63:0] mux_ex_out_alu_in,
  input wire [3:0] ALUOp,
  output wire [63:0] Result,
  output wire zero
);

  wire [63:0] abar, bbar;
  wire [63:0] mux1out, mux2out;
  wire [63:0] andOut, orOut, sumOut;

  assign abar = ~mux_1_out_alu_in;
  assign bbar = ~mux_ex_out_alu_in;

  assign mux1out = (ALUOp[3]) ? abar : mux_1_out_alu_in;
  assign mux2out = (ALUOp[2]) ? bbar : mux_ex_out_alu_in;

  assign andOut = mux1out & mux2out;
  assign orOut  = mux1out | mux2out;
  assign sumOut = mux1out + mux2out;

  assign Result = (ALUOp[1:0] == 2'b00) ? andOut :
                  (ALUOp[1:0] == 2'b01) ? orOut :
                  (ALUOp[1:0] == 2'b10) ? sumOut :
                  64'd0;

  assign zero = (Result == 64'd0);

endmodule
