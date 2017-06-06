`timescale 1ns / 1ps
module top_level #(parameter num_regs = 12, instr_width = 9, reg_width = 8, op_width = 3) (
  input     clk,
  input     start,
  output    halt);

  // IF outputs
  wire [instr_width-1:0] instruction;

  // DEC outputs
  wire [op_width-1:0] alu_op;
  wire [$clog2(num_regs)-1:0] rs_addr, rt_addr, rd_addr;
  wire [2:0] imm;
  wire reg_read, reg_write, sel_imm, branch, mem_read, mem_write, mem2reg;

  // REG outputs
  wire rt_out, rs_out;

  // ALU outputs
  wire [reg_width-1:0] res_out, car_out;
  wire zero, jump;

  logic[15:0] instr_count;
  logic[instr_width-1:0] start_addr;

  // ???
  wire taken;
  
  assign reg <= mem2reg == 0 ? res_out:data_out
  assign rt_out = (sel_imm==1) ? imm : rt_out;


  // instantiate modules
  fetch_unit IF (
    .clk,
    .start,
    .start_addr,
    .branch,
    .taken,
    .target(res_out[8:0]),
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
    .imm,
    .sel_imm,
    .branch,
    .mem_read,
    .mem_write,
    .mem2reg,
    .halt
    );


  reg_file REG (
    .clk,
    .read(reg_read),
    .write(reg_write),
    .rs_addr,
    .rt_addr,
    .rd_addr,
    .rd_in(reg), //assign reg <= mem2reg == 0 ? alu_out:data_out
    .rs_out,
    .rt_out
    );
    
  
  
  alu ALU (
    .ra_in(rs_out),
    .rb_in(rt_out), //assign rt_out = (sel_imm==1) ? imm : rt_out;
    .op(alu_op),
    .res_out,
    .car_out,
    .zero,
    .jump
    );
    
  //not done
  data_ram ram (
    .clk
    .read
    .write
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
