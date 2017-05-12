`timescale 1ns / 1ps

module reg_file_tb #(parameter reg_width = 8);

// inputs
reg clk;
reg write;
reg [$clog2(12)-1:0] rs_addr;
reg [$clog2(8)-1:0] rt_addr;
reg [$clog2(4)-1:0] rd_addr;
reg [reg_width-1:0] rd_in;

// outputs
wire [reg_width-1:0] rs_out;
wire [reg_width-1:0] rt_out;

// instantiate the device under test (DUT)
reg_file DUT (
  .clk,
  .write,
  .rs_addr,
  .rt_addr,
  .rd_addr,
  .rd_in,
  .rs_out,
  .rt_out
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

  rs_addr = 8;
  rt_addr = 4;
  
  rd_in = 255;

  #200;

  write = 1;

  #100;
  rd_in = 127;
  rd_addr = 1;

  #100;
  // check the last value written
  write = 0;

  #100;
  rs_addr = 9;
  rt_addr = 5;

  end

  always begin
  clk = 0;
  #50;
  clk = 1;
  #50;
  end

  endmodule
