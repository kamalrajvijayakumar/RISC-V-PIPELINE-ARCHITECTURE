logic clk;
logic reset;
logic [63:0] read_data_wb_in;
logic [63:0] alu_result_memout;
logic [4:0]  rd_memout;
logic regwrite_exout_memout;
logic memtoreg_exout_memout;

logic [63:0] read_data_wb_in_wbout;
logic [63:0] alu_result_memout_wbout;
logic [4:0]  rd_memout_wbout;
logic regwrite_exout_memout_wbout;
logic memtoreg_exout_memout_wbout;