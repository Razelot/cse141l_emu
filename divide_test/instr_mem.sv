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
  assign rom[11] = 'b000010001;
  assign rom[12] = 'b000001111;
  assign rom[13] = 'b110010110;
  assign rom[14] = 'b010001001;
  assign rom[15] = 'b001100110;
  assign rom[16] = 'b101010100;
  assign rom[17] = 'b001111100;
  assign rom[18] = 'b001011111;
  assign rom[19] = 'b001011110;
  assign rom[20] = 'b101010111;
  assign rom[21] = 'b001010111;
  assign rom[22] = 'b010011101;
  assign rom[23] = 'b010001000;
  assign rom[24] = 'b101100011;
  assign rom[25] = 'b101000100;
  assign rom[26] = 'b001010101;
  assign rom[27] = 'b001010110;
  assign rom[28] = 'b101000010;
  assign rom[29] = 'b001010101;
  assign rom[30] = 'b001010010;
  assign rom[31] = 'b011000000;
  assign rom[32] = 'b001100010;
  assign rom[33] = 'b101001011;
  assign rom[34] = 'b001001001;
  assign rom[35] = 'b001001010;
  assign rom[36] = 'b001001010;
  assign rom[37] = 'b001011000;
  assign rom[38] = 'b000010001;
  assign rom[39] = 'b000001111;
  assign rom[40] = 'b110001101;
  assign rom[41] = 'b011000000;
  assign rom[42] = 'b011101000;
  assign rom[43] = 'b101100101;
  assign rom[44] = 'b001100111;
  assign rom[45] = 'b001100110;
  assign rom[46] = 'b101000100;
  assign rom[47] = 'b001010101;
  assign rom[48] = 'b001100010;
  assign rom[49] = 'b101010011;
  assign rom[50] = 'b101100011;
  assign rom[51] = 'b001010110;
  assign rom[52] = 'b001011101;
  assign rom[53] = 'b011000000;
  assign rom[54] = 'b011010000;
  assign rom[55] = 'b011100000;
  assign rom[56] = 'b011110000;
  assign rom[57] = 'b101000011;
  assign rom[58] = 'b101001011;
  assign rom[59] = 'b101010011;
  assign rom[60] = 'b101011011;
  assign rom[61] = 'b101100011;
  assign rom[62] = 'b101101011;
  assign rom[63] = 'b101110011;
  assign rom[64] = 'b001010110;
  assign rom[65] = 'b001010110;
  assign rom[66] = 'b001010110;
  assign rom[67] = 'b001010001;
  assign rom[68] = 'b001011010;
  assign rom[69] = 'b001000110;
  assign rom[70] = 'b001000110;
  assign rom[71] = 'b001000110;
  assign rom[72] = 'b001000110;
  assign rom[73] = 'b111100110;
  assign rom[74] = 'b101000001;
  assign rom[75] = 'b001010110;
  assign rom[76] = 'b001010101;
  assign rom[77] = 'b001010110;
  assign rom[78] = 'b001010001;
  assign rom[79] = 'b001010110;
  assign rom[80] = 'b001001010;
  assign rom[81] = 'b001011001;
  assign rom[82] = 'b001010110;
  assign rom[83] = 'b001010001;
  assign rom[84] = 'b001010110;
  assign rom[85] = 'b001010001;
  assign rom[86] = 'b001010110;
  assign rom[87] = 'b001010001;
  assign rom[88] = 'b001010110;
  assign rom[89] = 'b001010001;
  assign rom[90] = 'b011000000;
  assign rom[91] = 'b001100010;
  assign rom[92] = 'b001100010;
  assign rom[93] = 'b001100010;
  assign rom[94] = 'b101100011;
  assign rom[95] = 'b101010011;
  assign rom[96] = 'b001101100;
  assign rom[97] = 'b010011100;
  assign rom[98] = 'b101100011;
  assign rom[99] = 'b101010011;
  assign rom[100] = 'b010011100;
  assign rom[101] = 'b001100010;
  assign rom[102] = 'b001100010;
  assign rom[103] = 'b001100010;
  assign rom[104] = 'b101110011;
  assign rom[105] = 'b101001001;
  assign rom[106] = 'b100111001;
  assign rom[107] = 'b011000000;
  assign rom[108] = 'b101000011;
  assign rom[109] = 'b001000110;
  assign rom[110] = 'b001000110;
  assign rom[111] = 'b001000110;
  assign rom[112] = 'b001000110;
  assign rom[113] = 'b001000110;
  assign rom[114] = 'b001010100;
  assign rom[115] = 'b001000110;
  assign rom[116] = 'b001100100;
  assign rom[117] = 'b101000100;
  assign rom[118] = 'b111010110;
  assign rom[119] = 'b111100110;
  assign rom[120] = 'b101001111;
  assign rom[121] = 'b000101010;
  assign rom[122] = 'b101101110;
  assign rom[123] = 'b011000000;
  assign rom[124] = 'b101000011;
  assign rom[125] = 'b101100011;
  assign rom[126] = 'b001000110;
  assign rom[127] = 'b001000110;
  assign rom[128] = 'b001000110;
  assign rom[129] = 'b001000110;
  assign rom[130] = 'b001000110;
  assign rom[131] = 'b001000110;
  assign rom[132] = 'b001000110;
  assign rom[133] = 'b001010110;
  assign rom[134] = 'b111010110;
  assign rom[135] = 'b101001000;
  assign rom[136] = 'b001001000;
  assign rom[137] = 'b001001010;
  assign rom[138] = 'b001111000;
  assign rom[139] = 'b101000000;
  assign rom[140] = 'b000000100;
  assign rom[141] = 'b101100110;
  assign rom[142] = 'b101001001;
  assign rom[143] = 'b000111000;
  assign rom[144] = 'b101101110;
  assign rom[145] = 'b101000100;
  assign rom[146] = 'b111100100;
  assign rom[147] = 'b111010100;
  assign rom[148] = 'b101001111;
  assign rom[149] = 'b000101010;
  assign rom[150] = 'b101101110;
  assign rom[151] = 'b011000000;
  assign rom[152] = 'b101001011;
  assign rom[153] = 'b001001010;
  assign rom[154] = 'b001001010;
  assign rom[155] = 'b001001010;
  assign rom[156] = 'b001001010;
  assign rom[157] = 'b001001010;
  assign rom[158] = 'b001001010;
  assign rom[159] = 'b001001010;
  assign rom[160] = 'b001001010;
  assign rom[161] = 'b001001010;
  assign rom[162] = 'b001001000;
  assign rom[163] = 'b001001010;
  assign rom[164] = 'b001111000;
  assign rom[165] = 'b001100010;
  assign rom[166] = 'b101000011;
  assign rom[167] = 'b111000110;
  assign rom[168] = 'b111110110;
  assign rom[169] = 'b101001111;
  assign rom[170] = 'b000111010;
  assign rom[171] = 'b101110110;
  assign rom[172] = 'b101010001;
  assign rom[173] = 'b010111100;
  assign rom[174] = 'b101010111;
  assign rom[175] = 'b010001101;
  assign rom[176] = 'b101010100;
  assign rom[177] = 'b010011110;
  assign rom[178] = 'b011000000;
  assign rom[179] = 'b101000011;
  assign rom[180] = 'b001000110;
  assign rom[181] = 'b001000110;
  assign rom[182] = 'b001000110;
  assign rom[183] = 'b001000110;
  assign rom[184] = 'b001000110;
  assign rom[185] = 'b001000110;
  assign rom[186] = 'b001000110;
  assign rom[187] = 'b001010100;
  assign rom[188] = 'b001000110;
  assign rom[189] = 'b001100100;
  assign rom[190] = 'b001100010;
  assign rom[191] = 'b101000011;
  assign rom[192] = 'b111010110;
  assign rom[193] = 'b111100110;
  assign rom[194] = 'b101001111;
  assign rom[195] = 'b000101010;
  assign rom[196] = 'b101101110;
  assign rom[197] = 'b111000000;



endmodule
