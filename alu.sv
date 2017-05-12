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

  // for ADD overflow/underflow
  reg [reg_width:0] sum;

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
  sum = ra_in +  rb_in;
  case (sum[reg_width:reg_width-1])
    2'b01 : begin //Overflow
    res_out <= 127;
    car_out <= 1;
    end
    2'b10 : begin //Underflow
    res_out <= -128;
    car_out <= -1;
    end
    default: begin // Within range
    res_out <= ra_in +  rb_in;
    car_out <= 0;
    end
  endcase
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
