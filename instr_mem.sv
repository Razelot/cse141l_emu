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

  // FOR TESTING
  assign rom[0] = 'b001000110;
  assign rom[1] = 'b001000110;
  assign rom[2] = 'b001000110;
  assign rom[3] = 'b001000110;
  assign rom[4] = 'b001000110;
  assign rom[5] = 'b001000110;
  assign rom[6] = 'b001000110;
  assign rom[7] = 'b001010110;
  assign rom[8] = 'b111010110;
  assign rom[9] = 'b101001000;
  assign rom[10] = 'b001011000;
  assign rom[11] = 'b010010000;
  assign rom[12] = 'b101101011;
  assign rom[13] = 'b111100100;
  assign rom[14] = 'b101010001;
  assign rom[15] = 'b000110111;
  assign rom[16] = 'b110000010;
  assign rom[17] = 'b110010110;
  assign rom[18] = 'b010001001;
  assign rom[19] = 'b001100110;
  assign rom[20] = 'b101010100;
  assign rom[21] = 'b001111100;
  assign rom[22] = 'b001011111;
  assign rom[23] = 'b001011110;
  assign rom[24] = 'b101010111;
  assign rom[25] = 'b001010111;
  assign rom[26] = 'b010011101;
  assign rom[27] = 'b010001000;
  assign rom[28] = 'b101100011;
  assign rom[29] = 'b101000100;
  assign rom[30] = 'b001010101;
  assign rom[31] = 'b001010110;
  assign rom[32] = 'b101000010;
  assign rom[33] = 'b001010101;
  assign rom[34] = 'b001010010;
  assign rom[35] = 'b011000000;
  assign rom[36] = 'b001100010;
  assign rom[37] = 'b101001011;
  assign rom[38] = 'b001001001;
  assign rom[39] = 'b001001010;
  assign rom[40] = 'b001001010;
  assign rom[41] = 'b001011000;
  assign rom[42] = 'b011000000;
  assign rom[43] = 'b101010011;
  assign rom[44] = 'b010011101;
  assign rom[45] = 'b101101100;
  assign rom[46] = 'b111100100;
  assign rom[47] = 'b101001001;
  assign rom[48] = 'b000100011;
  assign rom[49] = 'b110000010;
  assign rom[50] = 'b110011000;
  assign rom[51] = 'b011000000;
  assign rom[52] = 'b101000011;
  assign rom[53] = 'b001000110;
  assign rom[54] = 'b001000110;
  assign rom[55] = 'b001000110;
  assign rom[56] = 'b001000110;
  assign rom[57] = 'b001000110;
  assign rom[58] = 'b001000110;
  assign rom[59] = 'b001000110;
  assign rom[60] = 'b001100010;
  assign rom[61] = 'b101001011;
  assign rom[62] = 'b101100011;
  assign rom[63] = 'b101011011;
  assign rom[64] = 'b111000110;
  assign rom[65] = 'b001010010;
  assign rom[66] = 'b001010010;
  assign rom[67] = 'b001100111;
  assign rom[68] = 'b001100110;
  assign rom[69] = 'b101000100;
  assign rom[70] = 'b001000101;
  assign rom[71] = 'b001001010;
  assign rom[72] = 'b001010110;
  assign rom[73] = 'b001011001;
  assign rom[74] = 'b011000000;
  assign rom[75] = 'b011100000;
  assign rom[76] = 'b011110000;
  assign rom[77] = 'b101000011;
  assign rom[78] = 'b101001011;
  assign rom[79] = 'b101010011;
  assign rom[80] = 'b101011011;
  assign rom[81] = 'b101100011;
  assign rom[82] = 'b101101011;
  assign rom[83] = 'b101110011;
  assign rom[84] = 'b111000000;
endmodule
