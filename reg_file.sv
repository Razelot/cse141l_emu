`timescale 1ns / 1ps

module reg_file #(parameter num_regs = 13, reg_width = 8)
(
  input clk,
  input reg_clear, reg_write, car_write,
  input [$clog2(num_regs)-1:0] rt_addr, rs_addr, rd_addr,
  input [reg_width-1:0] rd_in, car_in,
  output logic [reg_width-1:0] rt_out, rs_out, rd_out);

  // register array
  logic [reg_width-1:0] core [num_regs-1:0];

  logic allow_write;

  // cannot write reg[0]
  assign allow_write = rd_addr != 8'b0000 && reg_write;


  assign rt_out = core[rt_addr];
  assign rs_out = core[rs_addr];
  assign rd_out = core[rd_addr];

  always_ff @ (posedge clk ) begin
    // ZERO REGISTER
    core[0] = 'b00000000;

    if(allow_write && reg_clear)
    core[rd_addr] <= 8'b00000000;
    else if(allow_write)
    core[rd_addr] <= rd_in;

    if(car_write)
    core[12] <= car_in;

  end

  endmodule
