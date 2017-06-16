`timescale 1ns / 1ps

module prog_counter #(parameter  rom_size = 512, instr_width = 9, reg_width = 8)
(
  input clk,
  input start,
  input [$clog2(rom_size):0] start_addr,
  input branch,
  input taken,
  input signed [reg_width-1:0] target,
  output [$clog2(rom_size):0] pc_out
  );

  reg [$clog2(rom_size):0] pc;

  assign pc_out = pc;

  always_ff @ (posedge clk)
  begin
  if (start) begin
  pc <= start_addr;
  end
  else if (taken)
  pc <= $signed(pc) + $signed(target);
  else if (branch)
  pc <= pc + 2;
  else
  pc <= pc + 1;
  end

  endmodule
