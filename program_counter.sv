module program_counter(
  
  input clk, reset, [63:0] mux_if_out_pc_in,
  output reg [63:0] pc_out_aim_in
);
  always @(posedge reset or posedge clk)
  begin
    if(reset)
      pc_out_aim_in <= 64'd0;
    else
      pc_out_aim_in <= mux_if_out_pc_in;
  end
endmodule 