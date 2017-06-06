`timescale 1ns / 1ps

module alu_tb #(parameter reg_width = 8, parameter op_width = 4);

// inputs
reg [reg_width-1:0] ra_in;
reg [reg_width-1:0] rb_in;
reg [op_width-1:0] op0, op1;

// outputs
wire [reg_width-1:0] res_out0, res_out1;
wire [reg_width-1:0] car_out0, car_out1;
wire zero0, zero1;
wire jump0, jump1;

// instantiate the device under test (DUT)
alu DUT0 (
  .ra_in,
  .rb_in,
  .op(op0),
  .res_out(res_out0),
  .car_out(car_out0),
  .zero(zero0),
  .jump(jump0)
  );

alu DUT1 (
  .ra_in,
  .rb_in,
  .op(op1),
  .res_out(res_out1),
  .car_out(car_out1),
  .zero(zero1),
  .jump(jump1)
  );

  initial begin
  // initialize inputs
  ra_in = 0;
  rb_in = 0;
  op0 = 0;
  op1 = 1;

  // wait 100 ns for global reset to finish
  #100;

  // TESTING SLT
  op0 = 1;
  ra_in = 0;
  rb_in = -1;

  #100;
  rb_in = 1;

  #100


  // TESTING AND & OR
  op0 = 0;
  op1 = 2;
  ra_in = 8'b11111111;
  rb_in = 8'b00111100;

  #100;
  ra_in = 8'b11000011;

  #100;
  rb_in = 8'b11111111;


  // TESTING ADD
  #500
  op0 = 4;
  ra_in = 90;
  rb_in = 20;

  #100;
  rb_in = 90;

  #100;
  rb_in = 200;

  #100;
  ra_in = -128;
  rb_in = 100;

  #100;
  ra_in = -128;
  rb_in = -100;

  #100;
  ra_in = 127;
  rb_in = 127;

  // TESTING SUB
  #500
  op0 = 5;
  ra_in = 90;
  rb_in = 20;

  #100;
  ra_in = 0;
  rb_in = 100;

  #100;
  ra_in = 0;
  rb_in = 255;

  // TESTING SHIFT_RIGHT_LOGICAL & SHIFT_RIGHT_ARITHMETIC
  #500
  op0 = 8;
  op1 = 9;
  ra_in = 8'b11110000;
  rb_in = 2;

  #100;
  rb_in = rb_in + 2;

  #100;
  rb_in = rb_in + 2;

  #100;
  rb_in = rb_in + 2;

  #100;
  rb_in = rb_in + 2;

  #100;
  rb_in = rb_in + 2;

  #100;
  rb_in = rb_in + 2;

  // TESTING BEQ and SW/LW
  #500
  op0 = 6;
  op1 = 7;

  ra_in = 8'b11111111;
  rb_in = 8'b00000000;

  #100;
  rb_in = 8'b11111111;


  end

  endmodule
