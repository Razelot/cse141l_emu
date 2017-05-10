// A synchronous instruction memory
`timescale 1ns / 1ps

module instr_mem #(parameter rom_size = 256)
(
  input clk,
  input [$clog2(rom_size)-1:0] instr_addr,
  output [$clog2(rom_size)-1:0] instr_out
  );

  // Store instructions in memory
  logic [$clog2(rom_size)-1:0] rom [rom_size-1:0];

  assign instr_out = rom[instr_addr];

endmodule
