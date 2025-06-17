class clock_generation;
  task clk_gen();
    $display("Clock Generation STARTS!");
    forever begin
      #5 clk = ~clk;
    end
  endtask
endclass
