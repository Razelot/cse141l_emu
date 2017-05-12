`timescale 1ns / 1ps

module alu #(parameter reg_width = 8, parameter op_width = 3)
(
  input signed [reg_width-1:0] ra_in,
  input signed [reg_width-1:0] rb_in,
  input [op_width-1:0] op,
  output reg signed [reg_width-1:0] res_out,
  output reg signed [reg_width-1:0] car_out,
  output logic zero,
  output logic jump
  );

  // for shift overflow
  logic [reg_width-1:0] mask;

  assign zero = (res_out == 0);

  always @* begin
  case(op)
  0: begin // AND
  res_out <= ra_in & rb_in;
  end
  1: begin	// OR
  res_out <= ra_in | rb_in;
  end
  2: begin  // ADD
  res_out   <= ra_in +  rb_in;
  car_out <= (128 > ra_in + rb_in) ? 1'b0 : 1'b1;
  end
  3: begin // SHIFT_RIGHT_LOGICAL
  res_out <= ra_in >> rb_in;
  car_out <= (rb_in < 8) ? ra_in << (8 - rb_in) : ra_in >> (rb_in - 8);
  end
  4: begin // SHIFT_RIGHT_ARITHMETIC
  res_out <= ra_in >>> rb_in;
  car_out <= (rb_in < 8) ? ra_in << (8 - rb_in) : ra_in >>> (rb_in - 8);
  end
  5: begin  // BEQ
  jump <= ra_in & rb_in;
  end
  6: begin // SW, LW
  res_out <= ra_in;
  end
  endcase
  end

  endmodule
