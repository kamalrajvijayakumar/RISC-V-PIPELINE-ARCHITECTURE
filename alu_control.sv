module alu_control_unit (
    input  wire [1:0]  ALUOp,
    input  wire [3:0]  func,
    output reg [3:0]  alu_control
);
  
  wire [1:0] aluop = ALUOp;
  wire [3:0] f = func;

  always @(*) begin
    case (aluop)
      2'b00: alu_control = 4'b0010; // For load/store: always ADD
      2'b01: alu_control = 4'b0110; // For branch: always SUB
      2'b10: begin
        case (f)
          // R-type instructions
          4'b0000: alu_control = 4'b0010; // ADD
          4'b1000: alu_control = 4'b0110; // SUB
          //4'b1000: alu_control = 4'b0110; // AND
          4'b0111: alu_control = 4'b0000; // OR
          4'b0110: alu_control = 4'b0001; // XOR
          4'b0100: alu_control = 4'b0011;
          default: alu_control = 4'b1111; // Invalid
        endcase
      end
      default: alu_control = 4'b1111; // Invalid ALUOp
    endcase
  end

endmodule

