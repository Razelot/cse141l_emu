`timescale 1ns / 1ps
module top_level #(parameter num_regs = 12, instr_width = 9, reg_width = 8, op_width = 4) (
  input     clk,
  input     start,
  output    halt);

  // IF outputs
  wire [instr_width-1:0] instruction;

  // DEC outputs
  wire [op_width-1:0] alu_op;
  wire [$clog2(num_regs)-1:0] rs_addr, rt_addr, rd_addr;
  wire [reg_width-1:0] imm;
  wire reg_read, reg_write, car_write, sel_imm, jump, mem_read, mem_write, mem2reg;

  // REG outputs
  wire [reg_width-1:0] rt_out, rs_out, rd_out;

  // ALU outputs
  wire [reg_width-1:0] res_out, car_out;
  wire zero, branch;

  // data memory outputs
  wire [7:0] mem_out;

  logic[15:0] instr_count;
  logic[instr_width-1:0] start_addr;

  // MUX
  wire [reg_width-1:0] rb_in, rd_in;
  assign rb_in = sel_imm ? imm : rt_out;
  assign rd_in = ~mem2reg ? res_out:mem_out;


  // instantiate modules
  fetch_unit IF (
    .clk,
    .start,
    .start_addr,
    .branch(branch),
    .taken(jump),
    .target(imm),
    .instr_out(instruction)
    );

  decoder DEC(
    .instruction,
    .alu_op,
    .rs_addr,
    .rt_addr,
    .rd_addr,
    .reg_read,
    .reg_write,
    .car_write,
    .imm,
    .sel_imm,
    .jump,
    .mem_read,
    .mem_write,
    .mem2reg,
    .halt
    );

  reg_file REG (
    .clk,
    .reg_read,
    .reg_write,
    .car_write,
    .rs_addr,
    .rt_addr,
    .rd_addr,
    .rd_in,
    .car_in(car_out),
    .rs_out,
    .rt_out,
    .rd_out
    );


  alu ALU (
    .ra_in(rs_out),
    .rb_in,
    .op(alu_op),
    .res_out,
    .car_out,
    .zero,
    .branch
    );


  data_ram RAM (
    .clk,
    .read(mem_read),
    .write(mem_write),
    .addr(res_out),
    .din(rt_out),
    .dout(mem_out)
  );


always@(posedge clk)
  if (start == 1)	begin
    instr_count <= 1'b0;
    start_addr <= 1'b0;
  end
  else if(halt == 0) begin
    instr_count <= instr_count + 1;
  end
endmodule
