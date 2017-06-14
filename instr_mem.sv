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
assign rom[1] = 'b011100011;
assign rom[2] = 'b101000101;
assign rom[3] = 'b101100101;
assign rom[4] = 'b010010110;
assign rom[5] = 'b101100101;
assign rom[6] = 'b010010110;
assign rom[7] = 'b011110001;
assign rom[8] = 'b101011110;
assign rom[9] = 'b101010101;
assign rom[10] = 'b010001110;
assign rom[11] = 'b011110000;
assign rom[12] = 'b101010101;
assign rom[13] = 'b011110001;
assign rom[14] = 'b011000001;
assign rom[15] = 'b101001101;
assign rom[16] = 'b011011001;
assign rom[17] = 'b000001111;
assign rom[18] = 'b110000101;
assign rom[19] = 'b111000000;
endmodule
