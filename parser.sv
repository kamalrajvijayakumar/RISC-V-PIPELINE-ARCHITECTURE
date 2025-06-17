module parser(
  input  wire [31:0] instruction_idout,
  output wire [6:0]  opcode,
  output wire [4:0]  rd,
  output wire [2:0]  funct3,
  output wire [4:0]  rs1,
  output wire [4:0]  rs2,
  output wire [6:0]  funct7
);

  assign opcode = instruction_idout[6:0];
  assign rd     = instruction_idout[11:7];
  assign funct3 = instruction_idout[14:12];
  assign rs1    = instruction_idout[19:15];
  assign rs2    = instruction_idout[24:20];
  assign funct7 = instruction_idout[31:25];
endmodule
