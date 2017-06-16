// A synchronous instruction memory
`timescale 1ns / 1ps

module instr_mem #(parameter rom_size = 512, parameter instr_width = 9)
(
  input [$clog2(rom_size):0] instr_addr,
  output [instr_width-1:0] instr_out
  );

  // Store instructions in memory
  logic [instr_width-1:0] rom [rom_size-1:0];

  assign instr_out = rom[instr_addr];

  assign rom[0] = 'b001001110;
  assign rom[1] = 'b001001110;
  assign rom[2] = 'b001001110;
  assign rom[3] = 'b001101100;
  assign rom[4] = 'b001001110;
  assign rom[5] = 'b001111100;
  assign rom[6] = 'b011110000;
  assign rom[7] = 'b101010110;
  assign rom[8] = 'b001001110;
  assign rom[9] = 'b001011100;
  assign rom[10] = 'b101001000;
  assign rom[11] = 'b001001110;
  assign rom[12] = 'b001011100;
  assign rom[13] = 'b101010000;
  assign rom[14] = 'b000100001;
  assign rom[15] = 'b000001111;
  assign rom[16] = 'b110000101;
  assign rom[17] = 'b001011011;
  assign rom[18] = 'b001011111;
  assign rom[19] = 'b001011110;
  assign rom[20] = 'b101001111;
  assign rom[21] = 'b010101011;
  assign rom[22] = 'b101101110;
  assign rom[23] = 'b111110100;
  assign rom[24] = 'b111100100;
  assign rom[25] = 'b101001111;
  assign rom[26] = 'b000111010;
  assign rom[27] = 'b101110110;
  assign rom[28] = 'b001001010;
  assign rom[29] = 'b001001010;
  assign rom[30] = 'b001001010;
  assign rom[31] = 'b001001010;
  assign rom[32] = 'b111000000;

endmodule
