`timescale 1ns / 1ps


/* r: number of registers
 * w: width of a register
 */
module reg_file #(parameter r = 12, parameter w = 9)
(
  input clk,
  input write,
  input [$clog2(16)-1:0] rs_addr,
  input [$clog2(4)-1:0] rt_addr,
  input [$clog2(4)-1:0] rd_addr,
  input [w-1:0] rd_in,
  output [w-1:0] rs_out,
  output [w-1:0] rt_out
);

	// register array
  logic [w-1:0] regs [r-1:0];

  assign	rs_out = regs[rs_addr];
	assign	rt_out = regs[rt_addr+4];

	always_ff @ (posedge clk ) begin

    // write to rd when enabled
    if(write) begin
      regs[rd_addr+8] <= rd_in;
    end

	end

endmodule
