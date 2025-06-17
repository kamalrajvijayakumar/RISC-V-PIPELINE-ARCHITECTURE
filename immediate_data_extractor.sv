module immediate_data_extractor(
  input  wire [31:0] instruction_idout,
  output reg  [63:0] imm_data
);

  wire [6:0] opcode = instruction_idout[6:0];

  always @(*) begin
    case (opcode)
      7'b0010011,
      7'b0000011,
      7'b1100111:
        imm_data = {{52{instruction_idout[31]}}, instruction_idout[31:20]};

      7'b0100011:
        imm_data = {{52{instruction_idout[31]}}, instruction_idout[31:25], instruction_idout[11:7]};

      7'b1100011:
        imm_data = {{51{instruction_idout[31]}}, instruction_idout[31], instruction_idout[7],
                    instruction_idout[30:25], instruction_idout[11:8], 1'b0};

      7'b0110011:
        imm_data = 64'd0;

      default:
        imm_data = 64'd0;
    endcase
  end

endmodule
