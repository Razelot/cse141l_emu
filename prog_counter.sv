`timescale 1ns / 1ps

module prog_counter #(parameter width = 9)
(
  input clk,
  input start,
  input start_addr[width-1:0],
  input branch,
  input taken,
  input target[width-1:0],
  output pc_out[width-1:0]
  );

  reg[width-1:0] pc;

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
