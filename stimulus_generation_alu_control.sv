class stimulus_generation;
  task stimulus();
    ALUOp = 2'b00;
    func = 0000;
    $display("%b",ALUOp);
    #1;
    
    ALUOp = 2'b01;
    func = 4'b0000;
    $display("%b   %b",ALUOp,func);
    #1;
    
    ALUOp = 2'b10;
    func  = 4'b0000;
    $display("%b   %b",ALUOp,func);
    #1;
    
    ALUOp = 2'b10;
    func  = 4'b1000;
    $display("%b   %b",ALUOp,func);
    #1;
    
    ALUOp = 2'b10;
    func  = 4'b0111;
    $display("%b   %b",ALUOp,func);
    #1;
    
    ALUOp = 2'b10;
    func  = 4'b0110;
    $display("%b   %b",ALUOp,func);
    #1;
    
    ALUOp = 2'b10;
    func  = 4'b0100;
    $display("%b   %b",ALUOp,func);
    #1;
    
    ALUOp = 2'b10;
    func  = 4'b1111;
    $display("%b   %b",ALUOp,func);
    #1;
    
    ALUOp = 2'b11;
    func = 0;
    $display("%b   %b",ALUOp,func);
    #1;
    
  endtask
endclass

    