`timescale 1ns / 1ps

module top_tb #(parameter num_regs = 12, instr_width = 9, reg_width = 8, op_idth = 3);

// inputs
reg clk;
reg start;

// outputs
wire halt;

// instantiate the device under test (DUT)

top_level DUT (
	.clk,
	.start,
	.halt
);

initial begin
// initialize inputs
clk = 0;
start = 0;


// wait 100 ns for global reset to finish
#100

// TESTING

start = 1;

#200

start = 0;

end

always begin
clk = 0;
#50;
clk = 1;
#50;
end

endmodule
