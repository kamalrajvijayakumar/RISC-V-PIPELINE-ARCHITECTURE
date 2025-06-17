module idregister (
  input  wire        clk,
  input  wire        reset,
  input  wire [63:0] pc_out_aim_in,
  input  wire [31:0] instruction,
  output reg  [63:0] pcid_out,
  output reg  [31:0] instruction_idout
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      pcid_out         <= 64'b0;
      instruction_idout <= 32'b0;
    end else begin
      pcid_out         <= pc_out_aim_in;
      instruction_idout <= instruction;
    end
  end

endmodule
