`timescale 1ns / 1ps

module prog_counter #(parameter width = 9)
(
  input clk,
  input start,
  input [width-1:0] start_addr,
  input branch,
  input taken,
  input [width-1:0] target,
  output [width-1:0] pc_out
  );

  reg [width-1:0] pc;

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
