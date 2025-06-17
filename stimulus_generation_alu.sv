class stimulus_generation;
  task stimulus();
    mux_1_out_alu_in = 64'hF0F0F0F0F0F0F0F0;
    mux_ex_out_alu_in = 64'h0F0F0F0F0F0F0F0F;
    ALUOp = 4'b0000;
    #10;

    mux_1_out_alu_in = 64'hAAAAAAAAAAAAAAAA;
    mux_ex_out_alu_in = 64'h5555555555555555;
    ALUOp = 4'b0001;
    #10;

    mux_1_out_alu_in = 64'd100;
    mux_ex_out_alu_in = 64'd200;
    ALUOp = 4'b0010;
    #10;

    mux_1_out_alu_in = 64'hFFFF0000FFFF0000;
    mux_ex_out_alu_in = 64'h0000FFFF0000FFFF;
    ALUOp = 4'b1000;
    #10;

    mux_1_out_alu_in = 64'h123456789ABCDEF0;
    mux_ex_out_alu_in = 64'h0F1E2D3C4B5A6978;
    ALUOp = 4'b0101;
    #10;

    mux_1_out_alu_in = 64'd50;
    mux_ex_out_alu_in = 64'd25;
    ALUOp = 4'b1110;
    #10;

    mux_1_out_alu_in = 64'd0;
    mux_ex_out_alu_in = 64'd0;
    ALUOp = 4'b0010;
    #10;

    mux_1_out_alu_in = 64'd0;
    mux_ex_out_alu_in = 64'hFFFFFFFFFFFFFFFF;
    ALUOp = 4'b0000;
    #10;

    mux_1_out_alu_in = 64'd0;
    mux_ex_out_alu_in = 64'h123456789ABCDEF0;
    ALUOp = 4'b0001;
    #10;

    mux_1_out_alu_in = 64'h7FFFFFFFFFFFFFFF;
    mux_ex_out_alu_in = 64'h1;
    ALUOp = 4'b0010;
    #10;
  endtask
endclass
