module memregister (
  input  wire        clk,
  input  wire        reset,
  input  wire [63:0] alu_result,
  input  wire [63:0] adder_ex_out,
  input  wire [63:0] mux_2_out,
  input  wire [4:0]  rd,
  input  wire        branch_exout,
  input  wire        memread_exout,
  input  wire        memtoreg_exout,
  input  wire        memwrite_exout,
  input  wire        regwrite_exout,
  input  wire        zero,

  output reg  [63:0] alu_result_memout,
  output reg  [63:0] adder_ex_out_mem_out,
  output reg  [63:0] mux_2_out_memout,
  output reg  [4:0]  rd_memout,
  output reg         branch_exout_memout,
  output reg         memread_exout_memout,
  output reg         memtoreg_exout_memout,
  output reg         memwrite_exout_memout,
  output reg         regwrite_exout_memout,
  output reg         zero_memout
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      alu_result_memout         <= 64'b0;
      adder_ex_out_mem_out      <= 64'b0;
      mux_2_out_memout          <= 64'b0;
      rd_memout                 <= 5'b0;
      branch_exout_memout       <= 1'b0;
      memread_exout_memout      <= 1'b0;
      memtoreg_exout_memout     <= 1'b0;
      memwrite_exout_memout     <= 1'b0;
      regwrite_exout_memout     <= 1'b0;
      zero_memout               <= 1'b0;
    end else begin
      alu_result_memout         <= alu_result;
      adder_ex_out_mem_out      <= adder_ex_out;
      mux_2_out_memout          <= mux_2_out;
      rd_memout                 <= rd;
      branch_exout_memout       <= branch_exout;
      memread_exout_memout      <= memread_exout;
      memtoreg_exout_memout     <= memtoreg_exout;
      memwrite_exout_memout     <= memwrite_exout;
      regwrite_exout_memout     <= regwrite_exout;
      zero_memout               <= zero;
    end
  end

endmodule
