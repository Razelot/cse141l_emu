`include "definitions.sv"

// A synchronous instruction memory

module instr_mem #(parameter addr_width = 9)
                 (input clk 
                 ,input instruction_pc[addr_width-1:0]
                 ,output instruction_out[addr_width-1:0]
                 );
// Store instructions in memory                             
logic [addr_width-1:0] mem [255:0];
	
always_ff @ (posedge clk)
  begin
    instruction_out <= instruction_pc;
  end
endmodule
