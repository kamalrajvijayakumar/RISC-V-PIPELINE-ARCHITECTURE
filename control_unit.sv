module control_unit (
  input  bit [6:0] opcode,
  output bit       branch,
  output bit       mem_read,
  output bit       mem_to_reg,
  output bit       mem_write,
  output bit       alu_src,
  output bit       reg_write,
  output bit [1:0] alu_op
);
  // Your control logic here
  // Example dummy logic for illustration
  always_comb begin
    case (opcode)
      7'b0110011: begin // R-type
        alu_src   = 0;
        mem_to_reg= 0;
        reg_write = 1;
        mem_read  = 0;
        mem_write = 0;
        branch    = 0;
        alu_op    = 2'b10;
      end
      7'b0000011: begin // Load
        alu_src   = 1;
        mem_to_reg= 1;
        reg_write = 1;
        mem_read  = 1;
        mem_write = 0;
        branch    = 0;
        alu_op    = 2'b00;
      end
      7'b0100011: begin // Store
        alu_src   = 1;
        mem_to_reg= 0;
        reg_write = 0;
        mem_read  = 0;
        mem_write = 1;
        branch    = 0;
        alu_op    = 2'b00;
      end
      7'b1100011: begin // Branch
        alu_src   = 0;
        mem_to_reg= 0;
        reg_write = 0;
        mem_read  = 0;
        mem_write = 0;
        branch    = 1;
        alu_op    = 2'b01;
      end
      default: begin
        alu_src   = 0;
        mem_to_reg= 0;
        reg_write = 0;
        mem_read  = 0;
        mem_write = 0;
        branch    = 0;
        alu_op    = 2'b00;
      end
    endcase
  end

endmodule
