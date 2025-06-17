class reset_generation;
  task rst_gen();
    $display("[%0t] Reset Generation begins...", $time);
    reset = 1'b1;
    #12;
    reset = 1'b0;
    $display("[%0t] Reset deasserted...", $time);
  endtask
endclass
