
// Uncomment only one at a time to run the respective module
//`define RUN_IMMEDIATE
//`define RUN_PARSER
//`define RUN_CONTROL_UNIT
//`define RUN_PROGRAM_COUNTER
//`define RUN_MUX_IF
//`define RUN_ADDER_IF
//`define RUN_ADDER_EX
//`define RUN_AND_GATE
//`define RUN_FORWARDING_UNIT
//`define RUN_ALU
//`define RUN_ALU_CONTROL_UNIT
//`define RUN_DATAMEMORY
//`define RUN_WBREGISTER
//`define RUN_IDREGISTER
//`define RUN_MEMREGISTER
`define RUN_EXREGISTER

module top;

  `ifdef RUN_IMMEDIATE
    `include "immediate_data_extractor.sv"
    `include "signals_immediate.sv"
    `include "stimulus_generation_immediate.sv"
    `include "comparison_immediate.sv"
    `include "run_test_immediate.sv"

    immediate_data_extractor dut (
      .instruction_idout(instruction_idout),
      .imm_data(imm_data)
    );

  `elsif RUN_PARSER
    `include "parser.sv"
    `include "signals_parser.sv"
    `include "stimulus_generation_parser.sv"
    `include "comparison_parser.sv"
    `include "run_test_parser.sv"

    parser dut (
      .instruction_idout(instruction_idout),
      .opcode(opcode),
      .rd(rd),
      .funct3(funct3),
      .rs1(rs1),
      .rs2(rs2),
      .funct7(funct7)
    );

  `elsif RUN_CONTROL_UNIT
    `include "control_unit.sv"
    `include "signals_control_unit.sv"
    `include "stimulus_generation_control_unit.sv"
    `include "comparison_control_unit.sv"
    `include "run_test_control_unit.sv"

    control_unit dut (
      .opcode(opcode),
      .branch(branch),
      .mem_read(mem_read),
      .mem_to_reg(mem_to_reg),
      .mem_write(mem_write),
      .alu_src(alu_src),
      .reg_write(reg_write),
      .alu_op(alu_op)
    );

  `elsif RUN_PROGRAM_COUNTER
    `include "program_counter.sv"
    `include "signals_program_counter.sv"
    `include "clock_generation.sv"
    `include "reset_generation.sv"
    `include "stimulus_generation_program_counter.sv"
    `include "comparison_program_counter.sv"
    `include "run_test_program_counter.sv"

    program_counter dut (
      .clk(clk),
      .reset(reset),
      .mux_if_out_pc_in(mux_if_out_pc_in),
      .pc_out_aim_in(pc_out_aim_in)
    );

  `elsif RUN_MUX_IF
    `include "mux_if.sv"
    `include "signals_mux_if.sv"
    `include "stimulus_generation_mux_if.sv"
    `include "comparison_mux_if.sv"
    `include "run_test_mux_if.sv"

    mux_if dut (
      .adder_if_out_mux_if_in(adder_if_out_mux_if_in),
      .adder_ex_out_mux_if_in(adder_ex_out_mux_if_in),
      .and_out(and_out),
      .mux_if_out_pc_in(mux_if_out_pc_in)
    );

  `elsif RUN_ADDER_IF
    `include "adder_if.sv"
    `include "signals_adder_if.sv"
    `include "stimulus_generation_adder_if.sv"
    `include "comparison_adder_if.sv"
    `include "run_test_adder_if.sv"

    adder_if dut (
      .pc_out_aim_in(pc_out_aim_in),
      .adder_if_out_mux_if_in(adder_if_out_mux_if_in)
    );

  `elsif RUN_ADDER_EX
    `include "adder_ex.sv"
    `include "signals_adder_ex.sv"
    `include "stimulus_generation_adder_ex.sv"
    `include "comparison_adder_ex.sv"
    `include "run_test_adder_ex.sv"

    adder_ex dut (
      .pcid_exout(pcid_exout),
      .imm_data_exout(imm_data_exout),
      .adder_ex_out_mem_in(adder_ex_out_mem_in)
    );

  `elsif RUN_AND_GATE
    `include "and_gate.sv"
    `include "signals_and_gate.sv"
    `include "stimulus_generation_and_gate.sv"
    `include "comparison_and_gate.sv"
    `include "run_test_and_gate.sv"

    and_gate dut (
      .branch_exout_memout(branch_exout_memout),
      .zero_memout(zero_memout),
      .and_out(and_out)
    );

  `elsif RUN_FORWARDING_UNIT
    `include "forwarding_unit.sv"
    `include "signals_forwarding_unit.sv"
    `include "stimulus_generation_forwarding_unit.sv"
    `include "comparison_forwarding_unit.sv"
    `include "run_test_forwarding_unit.sv"

    forwarding_unit dut (
      .rdMem(rdMem),
      .regWriteMem(regWriteMem),
      .rdWb(rdWb),
      .regWriteWb(regWriteWb),
      .rs1(rs1),
      .rs2(rs2),
      .ForwardA(ForwardA),
      .ForwardB(ForwardB)
    );

  `elsif RUN_ALU
    `include "alu.sv"
    `include "signals_alu.sv"
    `include "stimulus_generation_alu.sv"
    `include "comparison_alu.sv"
    `include "run_test_alu.sv"

    alu dut (
      .mux_1_out_alu_in(mux_1_out_alu_in),
      .mux_ex_out_alu_in(mux_ex_out_alu_in),
      .ALUOp(ALUOp),
      .Result(Result),
      .zero(zero)
    );

  `elsif RUN_ALU_CONTROL_UNIT
    `include "alu_control.sv"
    `include "signals_alu_control.sv"
    `include "stimulus_generation_alu_control.sv"
    `include "comparison_alu_control.sv"
    `include "run_test_alu_control.sv"

    alu_control_unit dut (
      .ALUOp(ALUOp),
      .func(func),
      .alu_control(alu_control)
    );

  `elsif RUN_DATAMEMORY
    `include "datamemory.sv"
    `include "signals_datamemory.sv"
    `include "stimulus_generation_datamemory.sv"
    `include "comparison_datamemory.sv"
    `include "run_datamemory.sv"

    datamemory dut (
      .alu_out(alu_out),
      .mux3_out_writedata_in(mux3_out_writedata_in),
      .mem_read(mem_read),
      .mem_write(mem_write),
      .read_data_out_mux5_1_in(read_data_out_mux5_1_in)
    );

  `elsif RUN_WBREGISTER
    `include "wbregister.sv"
    `include "signals_wbregister.sv"
    `include "stimulus_generation_wbregister.sv"
    `include "test_wb.sv"
    `include "run_test_wbregister.sv"

    wbregister dut (
      .clk(clk),
      .reset(reset),
      .read_data_wb_in(read_data_wb_in),
      .alu_result_memout(alu_result_memout),
      .rd_memout(rd_memout),
      .regwrite_exout_memout(regwrite_exout_memout),
      .memtoreg_exout_memout(memtoreg_exout_memout),
      .read_data_wb_in_wbout(read_data_wb_in_wbout),
      .alu_result_memout_wbout(alu_result_memout_wbout),
      .rd_memout_wbout(rd_memout_wbout),
      .regwrite_exout_memout_wbout(regwrite_exout_memout_wbout),
      .memtoreg_exout_memout_wbout(memtoreg_exout_memout_wbout)
    );

  `elsif RUN_IDREGISTER
    `include "idregister.sv"
    `include "signals_idregister.sv"
    `include "stimulus_generation_idregister.sv"
    `include "test_idr.sv"
    `include "run_test_idregister.sv"

    idregister dut (
      .clk(clk),
      .reset(reset),
      .pc_out_aim_in(pc_out_aim_in),
      .instruction(instruction),
      .pcid_out(pcid_out),
      .instruction_idout(instruction_idout)
    );

  `elsif RUN_MEMREGISTER
    `include "memregister.sv"
    `include "signals_memregister.sv"
    `include "stimulus_generation_memregister.sv"
    `include "test_memregister.sv"
    `include "run_test_memregister.sv"

    memregister dut (
      .clk(clk),
      .reset(reset),
      .alu_result(alu_result),
      .adder_ex_out(adder_ex_out),
      .mux_2_out(mux_2_out),
      .rd(rd),
      .branch_exout(branch_exout),
      .memread_exout(memread_exout),
      .memtoreg_exout(memtoreg_exout),
      .memwrite_exout(memwrite_exout),
      .regwrite_exout(regwrite_exout),
      .zero(zero),

      .alu_result_memout(alu_result_memout),
      .adder_ex_out_mem_out(adder_ex_out_mem_out),
      .mux_2_out_memout(mux_2_out_memout),
      .rd_memout(rd_memout),
      .branch_exout_memout(branch_exout_memout),
      .memread_exout_memout(memread_exout_memout),
      .memtoreg_exout_memout(memtoreg_exout_memout),
      .memwrite_exout_memout(memwrite_exout_memout),
      .regwrite_exout_memout(regwrite_exout_memout),
      .zero_memout(zero_memout)
    );

  `elsif RUN_EXREGISTER
    `include "exregister.sv"
    `include "signals_exregister.sv"
    `include "stimulus_generation_exregister.sv"
    `include "test_exregister.sv"
    `include "run_test_exregister.sv"

    exregister dut (
      .clk(clk),
      .reset(reset),
      .pcid_out(pcid_out),
      .readdata1ex(readdata1ex),
      .readdata2ex(readdata2ex),
      .imm_data(imm_data),
      .rd(rd),
      .rs1(rs1),
      .rs2(rs2),
      .instruction_idout(instruction_idout),
      .branch(branch),
      .memread(memread),
      .memtoreg(memtoreg),
      .memwrite(memwrite),
      .alusrc_in(alusrc_in),
      .regwrite(regwrite),
      .aluop_in(aluop_in),
      .pcid_exout(pcid_exout),
      .readdata1ex_out(readdata1ex_out),
      .readdata2ex_out(readdata2ex_out),
      .imm_data_exout(imm_data_exout),
      .rs1_ex(rs1_ex),
      .rs2_ex(rs2_ex),
      .rd_ex(rd_ex),
      .instruction_id_exout(instruction_id_exout),
      .branch_exout(branch_exout),
      .memread_exout(memread_exout),
      .memtoreg_exout(memtoreg_exout),
      .memwrite_exout(memwrite_exout),
      .alusrc(alusrc),
      .regwrite_exout(regwrite_exout),
      .aluop(aluop)
    );

  `endif

  run_test r;

  initial begin
    r = new();
    r.run();
  end

endmodule
