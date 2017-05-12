`timescale 1ns / 1ps

module alu_tb #(parameter reg_width = 9, parameter op_width = 3);

// inputs
reg [reg_width-1:0] ra_in;
reg [reg_width-1:0] rb_in;
reg [op_width-1:0] op;

// outputs
wire [reg_width-1:0] res_out;
wire [reg_width-1:0] car_out;
wire zero;
wire jump;

// instantiate the device under test (DUT)
alu DUT (
  .ra_in,
  .rb_in,
  .op,
  .res_out,
  .car_out,
  .zero,
  .jump
  );

  initial begin
  // initialize inputs
  ra_in = 0;
  rb_in = 0;
  op = 0;

  // wait 100 ns for global reset to finish
  #100;

  // TESTING SHIFT_RIGHT_LOGICAL
  op = 3;
  ra_in = 'b11110000;
  rb_in = 1;

  #100;
  rb_in = rb_in + 1;

  #100;
  rb_in = rb_in + 1;

  #100;
  rb_in = rb_in + 1;

  #100;
  rb_in = rb_in + 1;

  #100;
  rb_in = rb_in + 1;

  #100;
  rb_in = rb_in + 1;

  end


  endmodule
