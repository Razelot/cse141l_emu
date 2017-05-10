`timescale 1ns / 1ps

module reg_file_tb #(parameter w = 9);

	// inputs
  reg clk;
  reg write;
  reg [$clog2(16)-1:0] rs_addr;
  reg [$clog2(4)-1:0] rt_addr;
  reg [$clog2(4)-1:0] rd_addr;
  reg [w-1:0] rd_in;

  // outputs
  wire [w-1:0] rs_out;
  wire [w-1:0] rt_out;

	// instantiate the device under test (dut)
	reg_file dut (
    .clk(clk),
    .write(write),
    .rs_addr(rs_addr),
    .rt_addr(rt_addr),
    .rd_addr(rd_addr),
    .rd_in(rd_in),
    .rs_out(rs_out),
    .rt_out(rt_out)
	);

	initial begin
		// initialize inputs
		write = 0;
		rs_addr = 0;
		rt_addr = 0;
		rd_addr = 0;
		rd_in = 0;

		// wait 100 ns for global reset to finish
		#100;

    rd_in = 255;

    #200;

    write = 1;

    #100

    // check the last value written
    rs_addr = 8;

	end

  always begin
    clk = 0;
    #50;
    clk = 1;
    #50;
  end

endmodule
