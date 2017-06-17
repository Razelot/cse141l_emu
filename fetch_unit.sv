`timescale 1ns / 1ps

module fetch_unit #(parameter rom_size = 512, instr_width = 9, reg_width = 8)
(
  input clk,
  input start,
  input [$clog2(rom_size):0] start_addr,
  input branch,
  input taken,
  input signed [reg_width-1:0] target,
  output [instr_width-1:0] instr_out
  );

wire [$clog2(rom_size):0] pc_out;

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
