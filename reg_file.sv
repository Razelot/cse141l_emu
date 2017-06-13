`timescale 1ns / 1ps

module reg_file #(parameter num_regs = 12, reg_width = 8)
(
  input clk,
  input reg_read, reg_write, car_write,
  input [$clog2(num_regs)-1:0] rt_addr, rs_addr, rd_addr,
  input [reg_width-1:0] rd_in, car_in,
  output logic [reg_width-1:0] rt_out, rs_out, rd_out);

  // register array
  logic [reg_width-1:0] regs [num_regs-1:0];

  logic allow_write;

  // cannot write reg[0]
  assign allow_write = rd_addr != 8'b0000 && reg_write;


  assign rt_out = regs[rt_addr];
  assign rs_out = regs[rs_addr];
  assign rd_out = regs[rd_addr];

  always_ff @ (posedge clk ) begin
    // ZERO REGISTER
    regs[0] = 'b00000000;

    // if(reg_read) begin
    // rt_out <= regs[rt_addr];
    // rs_out <= regs[rs_addr];
    // end

    if(allow_write)
    regs[rd_addr] <= rd_in;

    if(car_write)
    regs[11] <= car_in;

  end

  endmodule
