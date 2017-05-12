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
  assign rom[0] = 'b000000000;
  assign rom[1] = 'b000000001;
  assign rom[2] = 'b000000010;
  assign rom[3] = 'b000000011;
  assign rom[4] = 'b000000100;
  assign rom[5] = 'b000000101;
  assign rom[6] = 'b000000110;
  assign rom[7] = 'b000000111;
  assign rom[8] = 'b000001000;
  assign rom[9] = 'b000001001;
  assign rom[10] = 'b000001010;
  assign rom[11] = 'b000001011;
  assign rom[12] = 'b000001100;
  assign rom[13] = 'b000001101;
  assign rom[14] = 'b000001110;
  assign rom[15] = 'b000001111;


  assign rom[255] = 'b011111111;

endmodule
