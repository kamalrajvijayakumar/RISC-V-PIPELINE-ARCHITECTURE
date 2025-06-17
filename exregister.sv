module exregister (
  input  wire        clk,
  input  wire        reset,
  input  wire [63:0] pcid_out,
  input  wire [63:0] readdata1ex,
  input  wire [63:0] readdata2ex,
  input  wire [63:0] imm_data,
  input  wire [4:0]  rd,
  input  wire [4:0]  rs1,
  input  wire [4:0]  rs2,
  input  wire [31:0] instruction_idout,
  input  wire        branch,
  input  wire        memread,
  input  wire        memtoreg,
  input  wire        memwrite,
  input  wire        alusrc_in,
  input  wire        regwrite,
  input  wire [1:0]  aluop_in,

  output reg  [63:0] pcid_exout,
  output reg  [63:0] readdata1ex_out,
  output reg  [63:0] readdata2ex_out,
  output reg  [63:0] imm_data_exout,
  output reg  [4:0]  rs1_ex,
  output reg  [4:0]  rs2_ex,
  output reg  [4:0]  rd_ex,
  output reg  [3:0]  instruction_id_exout,
  output reg         branch_exout,
  output reg         memread_exout,
  output reg         memtoreg_exout,
  output reg         memwrite_exout,
  output reg         alusrc,
  output reg         regwrite_exout,
  output reg  [1:0]  aluop
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      pcid_exout           <= 64'b0;
      readdata1ex_out      <= 64'b0;
      readdata2ex_out      <= 64'b0;
      imm_data_exout       <= 64'b0;
      rs1_ex               <= 5'b0;
      rs2_ex               <= 5'b0;
      rd_ex                <= 5'b0;
      instruction_id_exout <= 4'b0;
      branch_exout         <= 1'b0;
      memread_exout        <= 1'b0;
      memtoreg_exout       <= 1'b0;
      memwrite_exout       <= 1'b0;
      alusrc               <= 1'b0;
      regwrite_exout       <= 1'b0;
      aluop                <= 2'b0;
    end else begin
      pcid_exout           <= pcid_out;
      readdata1ex_out      <= readdata1ex;
      readdata2ex_out      <= readdata2ex;
      imm_data_exout       <= imm_data;
      rs1_ex               <= rs1;
      rs2_ex               <= rs2;
      rd_ex                <= rd;
      instruction_id_exout <= {instruction_idout[30], instruction_idout[14:12]}; // funct3 + bit 30 (for ALU control)
      branch_exout         <= branch;
      memread_exout        <= memread;
      memtoreg_exout       <= memtoreg;
      memwrite_exout       <= memwrite;
      alusrc               <= alusrc_in;
      regwrite_exout       <= regwrite;
      aluop                <= aluop_in;
    end
  end

endmodule
