`timescale 1ns / 1ps

module prog_counter #(parameter instr_width = 9, reg_width = 8)
(
  input clk,
  input start,
  input [instr_width-1:0] start_addr,
  input branch,
  input taken,
  input [reg_width-1:0] target,
  output [instr_width-1:0] pc_out
  );

  reg [instr_width-1:0] pc;

  assign pc_out = pc;

  always_ff @ (posedge clk)
  begin
  if (start) begin
  pc <= start_addr;
  end
  else if (branch && taken)
  pc <= target;
  else
  pc <= pc + 1;
  end

  endmodule
