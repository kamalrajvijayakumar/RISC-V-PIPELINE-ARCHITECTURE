module datamemory(
  input  wire [31:0] alu_out,
  input  wire [31:0] mux3_out_writedata_in,
  //input  logic clk,
  //input  logic rst,
  input  wire mem_read,
  input  wire mem_write,
  output reg [31:0] read_data_out_mux5_1_in
);

  // Byte-addressable memory: 64 bytes
  reg [7:0] datamemory_array [31:0];

  // Internal register to hold read data
  //reg [31:0] read_data;

  // Memory write & read logic in one always_ff block
  always @ (*) begin
      //read_data = 32'h0;
      
    //foreach (datamemory_array[i])
      //datamemory_array[i] <= 32'h0;      
     
    // Write 32-bit word
    if (mem_write /*& !mem_read */) begin
      
      datamemory_array[alu_out[5:0]+3] = mux3_out_writedata_in[7:0];
      datamemory_array[alu_out[5:0]+2] = mux3_out_writedata_in[15:8];
      datamemory_array[alu_out[5:0]+1] = mux3_out_writedata_in[23:16];
      datamemory_array[alu_out[5:0]+0] = mux3_out_writedata_in[31:24];
    end

    // Read 32-bit word
    if (mem_read /* & !mem_write */) begin
      /*read_data*/ read_data_out_mux5_1_in <= {
        datamemory_array[alu_out[5:0]+0],
        datamemory_array[alu_out[5:0]+1],
        datamemory_array[alu_out[5:0]+2],
        datamemory_array[alu_out[5:0]+3]
      };
    end
    
  end

endmodule
