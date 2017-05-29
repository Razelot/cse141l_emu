// Revision:  2017.02.25
// Revision 0.01 - File Created
// Additional Comments:
// default width = 8 bits; depth = 256 elements (8-bit address)
module data_ram #(parameter D=8, W=8)(
  input        clk,
  input        read, write,
  input        [D-1:0] addr,
  input        [W-1:0] din,
  output logic [W-1:0] dout);

  // register array as memory of depth size D
  logic [W-1:0] my_memory [2**D];

  //  could put internal pre-load here -- handled by test bench
  // initial
  // $readh("dataram_init.list", my_memory);

  always_comb // reads are combinational
  if(read) begin
  dout = my_memory[addr];
  // $display("Memory read M[%d] = %d",addr,dout);
  end
  else
  dout = 'bZ; // automatically sizes string of hi-Z to width W

  always_ff @ (posedge clk) // writes are clocked (sequential)
  if(write) begin
  my_memory[addr] = din;
  // $display("Memory write M[%d] = %d",addr,din);
  end

  endmodule
