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
  assign rom[0] = 'b011000000;
  assign rom[1] = 'b101000011;
  assign rom[2] = 'b001000110;
  assign rom[3] = 'b001000110;
  assign rom[4] = 'b001000110;
  assign rom[5] = 'b001000110;
  assign rom[6] = 'b001000110;
  assign rom[7] = 'b001000110;
  assign rom[8] = 'b001000110;
  assign rom[9] = 'b101100011;
  assign rom[10] = 'b001010110;
  assign rom[11] = 'b111010110;
  assign rom[12] = 'b001011100;
  assign rom[13] = 'b101011011;
  assign rom[14] = 'b010001101;
  assign rom[15] = 'b101101100;
  assign rom[16] = 'b111100100;
  assign rom[17] = 'b101001001;
  assign rom[18] = 'b000100011;
  assign rom[19] = 'b110000010;
  assign rom[20] = 'b110010101;
  assign rom[21] = 'b101111000;
  assign rom[22] = 'b011000001;
  assign rom[23] = 'b101010011;
  assign rom[24] = 'b001111100;
  assign rom[25] = 'b001011111;
  assign rom[26] = 'b101111010;
  assign rom[27] = 'b011000001;
  assign rom[28] = 'b101000111;
  assign rom[29] = 'b001100111;
  assign rom[30] = 'b101110100;
  assign rom[31] = 'b010110101;
  assign rom[32] = 'b101000100;
  assign rom[33] = 'b001010101;
  assign rom[34] = 'b001010110;
  assign rom[35] = 'b101000011;
  assign rom[36] = 'b001010101;
  assign rom[37] = 'b011000001;
  assign rom[38] = 'b101110011;
  assign rom[39] = 'b101001011;
  assign rom[40] = 'b001111001;
endmodule
