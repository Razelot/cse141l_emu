// A synchronous instruction memory
`timescale 1ns / 1ps

module instr_mem #(parameter rom_size = 256, parameter instr_width = 9)
(
  input [$clog2(rom_size):0] instr_addr,
  output [$clog2(rom_size):0] instr_out
  );

  // Store instructions in memory
  logic [instr_width-1:0] rom [rom_size-1:0];

  assign instr_out = rom[instr_addr];

  assign rom[0] = 'b001000110;
  assign rom[1] = 'b001010100;
  assign rom[2] = 'b101001000;
  assign rom[3] = 'b001000110;
  assign rom[4] = 'b001010100;
  assign rom[5] = 'b101010000;
  assign rom[6] = 'b001000110;
  assign rom[7] = 'b001100100;
  assign rom[8] = 'b001000110;
  assign rom[9] = 'b001110100;
  assign rom[10] = 'b000100001;
  assign rom[11] = 'b000001111;
  assign rom[12] = 'b110000101;
  assign rom[13] = 'b001000110;
  assign rom[14] = 'b001000110;
  assign rom[15] = 'b001000110;
  assign rom[16] = 'b001000110;
  assign rom[17] = 'b111000000;





endmodule
