`timescale 1ns / 1ps

module fetch_unit #(parameter width = 9)
(
  input clk,
  input start,
  input [width-1:0] start_addr,
  input branch,
  input taken,
  input [width-1:0] target,
  output [width-1:0] instr_out
  );

wire [width-1:0] pc_out;

// instantiate the device under test
prog_counter PC (
  .clk,
  .start,
  .start_addr,
  .branch,
  .taken,
  .target,
  .pc_out
  );

instr_mem ROM (
  .instr_addr(pc_out),
  .instr_out
  );

endmodule
