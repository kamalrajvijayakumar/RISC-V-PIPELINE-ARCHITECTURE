module forwarding_unit(
  input wire [4:0] rdMem,
  input wire regWriteMem,
  input wire [4:0] rdWb,
  input wire regWriteWb,
  input wire [4:0] rs1,
  input wire [4:0] rs2,
  output reg [1:0] ForwardA,
  output reg [1:0] ForwardB
);
  
  always @(*) begin
    // ForwardB logic
    if (regWriteMem && (rdMem != 5'b0) && (rdMem == rs2))
      ForwardB = 2'b10;
    else if (regWriteWb && (rdWb != 5'b0) && (rdWb == rs2))
      ForwardB = 2'b01;
    else
      ForwardB = 2'b00;

    // ForwardA logic
    if (regWriteMem && (rdMem != 5'b0) && (rdMem == rs1))
      ForwardA = 2'b10;
    else if (regWriteWb && (rdWb != 5'b0) && (rdWb == rs1))
      ForwardA = 2'b01;
    else
      ForwardA = 2'b00;
  end

endmodule
