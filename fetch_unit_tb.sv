`timescale 1ns / 1ps

module fetch_unit_tb #(parameter width = 9);

// inputs
reg clk;
reg start;
reg [width-1:0] start_addr;
reg branch;
reg taken;
reg [width-1:0] target;

// outputs
wire [width-1:0] instr_out;

// instantiate the device under test
fetch_unit DUT (
  .clk,
  .start,
  .start_addr,
  .branch,
  .taken,
  .target,
  .instr_out
  );

  initial begin
  // initialize inputs
  start = 0;
  branch = 0;
  taken = 0;
  target = 0;
  start_addr = 0;

  // wait 100 ns for global reset to finish
  #100;

  start = 1;

  #300;
  // remove signal to begin the pc
  start = 0;

  // pc should increment by 1 for ever cycle passed
  #1500;

  // PC should not branch until branch is taken
  target = 255;

  // go to ROM address 16 when taken
  #200
  branch = 1;
  taken = 1;

  #100
  branch = 0;
  taken = 0;

  end

  always begin
  clk = 0;
  #50;
  clk = 1;
  #50;
  end

endmodule
