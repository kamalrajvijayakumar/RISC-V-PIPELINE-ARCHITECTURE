class stimulus_generation;
  task stimulus();
    // Test 0
    pcid_exout     = 64'd100;
    imm_data_exout = 64'd4;    
    #10;

    // Test 1
    pcid_exout     = 64'd200;
    imm_data_exout = 64'd7;    
    #10;

    // Test 2
    pcid_exout     = 64'd50;
    imm_data_exout = 64'd0;    
    #10;

    // Test 3
    pcid_exout     = 64'd1000;
    imm_data_exout = -64'sd5; 
    #10;
  endtask
endclass
