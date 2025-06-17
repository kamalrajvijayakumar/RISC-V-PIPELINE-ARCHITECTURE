//stimulus_generation.sv
class stimulus_generation;
  task stimulus();
    $display("Entered Stimulus from run");
    
    #1
    mem_write = 1;
    mem_read = 0;
    #1
    mux3_out_writedata_in = 32'b10101010101010101010101010101010;
    #5
    mem_write = 0;
    mem_read = 0;
    #5
    
    mem_write = 0;
    mem_read = 1;
    #1
    
    #5
    
    mem_write = 0;
    mem_read = 0;
        
    #1
    mem_write = 1;
    mem_read = 0;
    #1
    mux3_out_writedata_in = 32'b01010101010101010101010101010101;
    #5
   
    mem_write = 0;
    mem_read = 0;
    #5
    
    mem_write = 0;
    mem_read = 1;
    #1
    
    #5
   
    mem_write = 0;
    mem_read = 0;

    #1
    mem_write = 1;
    mem_read = 0;
    #1
    mux3_out_writedata_in = 32'b11111111111111110000000000000000;
    #5
   
    mem_write = 0;
    mem_read = 0;
    #5
    
    mem_write = 0;
    mem_read = 1;
    #1
    
    #5
    
    mem_write = 0;
    mem_read = 0;
    
    
    $display("Left Stimulus to run");
  endtask
endclass

