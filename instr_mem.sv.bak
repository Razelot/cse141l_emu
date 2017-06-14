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
assign rom[0] = 'b011110001;
assign rom[1] = 'b101110110;
assign rom[2] = 'b101111110;
assign rom[3] = 'b101101110;
assign rom[4] = 'b101001011;
assign rom[5] = 'b111111010;
assign rom[6] = 'b110111100;
assign rom[7] = 'b100111001;
assign rom[8] = 'b010111010;
assign rom[9] = 'b001111001;
assign rom[10] = 'b001110100;
endmodule
