`timescale 1ns / 1ps

module alu #(parameter reg_width = 9, parameter op_width = 3)
(
  input [reg_width-1:0] ra_in,
  input [reg_width-1:0] rb_in,
  input [op_width-1:0] op,
  output reg [reg_width-1:0] res_out,
  output reg [reg_width-1:0] car_out,
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
  car_out <= (127 <= ra_in + rb_in) ? 1'b1 : 1'b0;
  end
  3: begin // SHIFT_RIGHT_LOGICAL
  car_out = ra_in;
  case (rb_in)
    0 :begin
    car_out <= 8'b00000000;
    end
    1:begin
    res_out <= res_out >> 1;
    car_out <= car_out << 7;
    end
    2: begin
    res_out <= res_out >> 2;
    car_out <= car_out << 6;
    end
    3: begin
    res_out <= res_out >> 3;
    car_out <= car_out << 5;
    end
    4: begin
    res_out <= res_out >> 4;
    car_out <= car_out << 4;
    end
    5: begin
    res_out <= res_out >> 5;
    car_out <= car_out << 3;
    end
    6: begin
    res_out <= res_out >> 6;
    car_out <= car_out << 2;
    end
    7: begin
    res_out <= res_out >> 7;
    car_out <= car_out << 1;
    end
    8: begin
    res_out <= res_out >> 8;
    end
    9: begin
    res_out <= res_out >> 8;
    car_out <= car_out >> 1;
    end
    10: begin
    res_out <= res_out >> 8;
    car_out <= car_out >> 2;
    end
    11: begin
    res_out <= res_out >> 8;
    car_out <= car_out >> 3;
    end
    12: begin
    res_out <= res_out >> 8;
    car_out <= car_out >> 4;
    end
    13: begin
    res_out <= res_out >> 8;
    car_out <= car_out >> 5;
    end
    14: begin
    res_out <= res_out >> 8;
    car_out <= car_out >> 6;
    end
    15: begin
    res_out <= res_out >> 8;
    car_out <= car_out >> 7;
    end
    16: begin
    res_out <= res_out >> 8;
    car_out <= car_out >> 8;
    end
    endcase
    end
  4: begin // SHIFT_RIGHT_ARITHMETIC
  car_out = ra_in;
  case (rb_in)
    0 :begin
    car_out <= 8'b00000000;
    end
    1:begin
    res_out <= res_out >>> 1;
    car_out <= car_out << 7;
    end
    2: begin
    res_out <= res_out >>> 2;
    car_out <= car_out << 6;
    end
    3: begin
    res_out <= res_out >>> 3;
    car_out <= car_out << 5;
    end
    4: begin
    res_out <= res_out >>> 4;
    car_out <= car_out << 4;
    end
    5: begin
    res_out <= res_out >>> 5;
    car_out <= car_out << 3;
    end
    6: begin
    res_out <= res_out >>> 6;
    car_out <= car_out << 2;
    end
    7: begin
    res_out <= res_out >>> 7;
    car_out <= car_out << 1;
    end
    8: begin
    res_out <= res_out >>> 8;
    end
    9: begin
    res_out <= res_out >>> 8;
    car_out <= car_out >>> 1;
    end
    10: begin
    res_out <= res_out >>> 8;
    car_out <= car_out >>> 2;
    end
    11: begin
    res_out <= res_out >>> 8;
    car_out <= car_out >>> 3;
    end
    12: begin
    res_out <= res_out >>> 8;
    car_out <= car_out >>> 4;
    end
    13: begin
    res_out <= res_out >>> 8;
    car_out <= car_out >>> 5;
    end
    14: begin
    res_out <= res_out >>> 8;
    car_out <= car_out >>> 6;
    end
    15: begin
    res_out <= res_out >>> 8;
    car_out <= car_out >>> 7;
    end
    16: begin
    res_out <= res_out >>> 8;
    car_out <= car_out >>> 8;
    end
    endcase
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
