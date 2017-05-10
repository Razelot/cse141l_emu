`timescale 1ns / 1ps

module fetch_unit_tb #(parameter width = 9);

// inputs
reg clk;
reg start;
input start_addr[width-1:0];
input branch;
input taken;
input target[width-1:0];

// outputs
wire pc_out[width-1:0];

// instantiate the device under test (dut)
prog_counter dut (
  .clk,
  .start,
  .start_addr,
  .branch,
  .taken,
  .target,
  .pc_out
  );

  initial begin
  // initialize inputs
  write = 0;
  rs_addr = 0;
  rt_addr = 0;
  rd_addr = 0;
  rd_in = 0;

  // wait 100 ns for global reset to finish
  #100;

  rd_in = 255;

  #200;

  write = 1;

  #100

  // check the last value written
  rs_addr = 8;

  end

  always begin
  clk = 0;
  #50;
  clk = 1;
  #50;
  end

endmodule
