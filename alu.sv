`timescale 1ns / 1ps

module alu #(parameter reg_width = 8, op_width = 4)
(
  input [reg_width-1:0] ra_in,
  input [reg_width-1:0] rb_in,
  input [op_width-1:0] op,
  output reg [reg_width-1:0] res_out,
  output reg [reg_width-1:0] car_out,
  output logic zero,
  output logic jump
  );

  // for ADD/SUB overflow/underflow
  reg [reg_width:0] add, sub;

  assign add = ra_in + rb_in;
  assign sub = ra_in - rb_in;

  assign zero = (res_out == 0);

  always @* begin
  case(op)
  0: begin // AND
  res_out <= ra_in & rb_in;
  end
  1: begin // SLT
  res_out <= $signed(ra_in) < $signed(rb_in) ? -1 : 0;
  end
  2: begin // OR
  res_out <= ra_in | rb_in;
  end
  3: begin // NOT
  res_out <= ~ra_in;
  end
  4: begin // ADD
  res_out <= add[reg_width-1:0];
  car_out <= add[reg_width]; // OVERFLOW
  end
  5: begin  // SUB
  res_out <= sub[reg_width-1:0];
  car_out <= sub[reg_width:reg_width-1] == 2'b10; // UNDERFLOW
  end
  6: begin // SW, LW
  res_out <= ra_in;
  end
  7: begin // BEQ
  jump <= ra_in == rb_in;
  end
  8: begin // SHIFT_RIGHT_LOGICAL
  res_out <= ra_in >> rb_in;
  car_out <= (rb_in < 8) ? ra_in << (8 - rb_in) : ra_in >> (rb_in - 8);
  end
  9: begin // SHIFT_RIGHT_ARITHMETIC
  res_out <= ra_in >>> rb_in;
  car_out <= (rb_in < 8) ? ra_in << (8 - rb_in) : ra_in >>> (rb_in - 8);
  end
  10: begin // SHIFT_LEFT_LOGICAL
  res_out <= ra_in << rb_in;
  car_out <= (rb_in < 8) ? ra_in << (8 - rb_in) : ra_in << (rb_in - 8);
  end
  endcase
  end

  endmodule
