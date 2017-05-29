`timescale 1ns / 1ps

module reg_file #(parameter num_regs = 12, reg_width = 8)
(
  input clk,
  input read, write,
  input [$clog2(num_regs)-1:0] rt_addr, rs_addr, rd_addr,
  input [reg_width-1:0] rd_in,
  output logic [reg_width-1:0] rt_out rs_out);

  // register array
  logic [reg_width-1:0] regs [num_regs-1:0];

  always_ff @ (posedge clk ) begin

    if(read) begin
    rt_out <= regs[rs_addr];
    rs_out <= regs[rt_addr];
    end

    if(write)
    regs[rd_addr] <= rd_in;

  end

  endmodule
