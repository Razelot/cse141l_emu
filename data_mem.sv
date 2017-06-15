module data_mem #(parameter D=8, W=8)(
  input        clk,
  input        read, write,
  input        [D-1:0] addr,
  input        [W-1:0] din,
  output logic [W-1:0] dout);

  // register array as memory of depth size D
  logic [W-1:0] core [2**D];

  always_comb // reads are combinational
  if(read) begin
  dout = core[addr];
  end
  else
  dout = 'bZ; // automatically sizes string of hi-Z to width W

  always_ff @ (posedge clk) // writes are clocked (sequential)
  if(write) begin
  core[addr] = din;
  end

  endmodule
