module wbregister( 
  input  wire        clk, 
  input  wire        reset,
  input  wire [63:0] read_data_wb_in,
  input  wire [63:0] alu_result_memout,
  input  wire [4:0]  rd_memout,
  input  wire        regwrite_exout_memout,
  input  wire        memtoreg_exout_memout,

  output reg  [63:0] read_data_wb_in_wbout,
  output reg  [63:0] alu_result_memout_wbout,
  output reg  [4:0]  rd_memout_wbout,
  output reg         regwrite_exout_memout_wbout,
  output reg         memtoreg_exout_memout_wbout
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      read_data_wb_in_wbout           <= 64'b0;
      alu_result_memout_wbout         <= 64'b0;
      rd_memout_wbout                 <= 5'b0;
      regwrite_exout_memout_wbout     <= 1'b0;
      memtoreg_exout_memout_wbout     <= 1'b0;
    end else begin
      read_data_wb_in_wbout           <= read_data_wb_in;
      alu_result_memout_wbout         <= alu_result_memout;
      rd_memout_wbout                 <= rd_memout;
      regwrite_exout_memout_wbout     <= regwrite_exout_memout;
      memtoreg_exout_memout_wbout     <= memtoreg_exout_memout;
    end
  end

endmodule
