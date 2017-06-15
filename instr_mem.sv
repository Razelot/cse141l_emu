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
assign rom[12] = 'b101010000;
assign rom[13] = 'b001011100;
assign rom[14] = 'b101101000;
assign rom[15] = 'b111100100;
assign rom[16] = 'b101001001;
assign rom[17] = 'b011010000;
assign rom[18] = 'b000100111;
endmodule
