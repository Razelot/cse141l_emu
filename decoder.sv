`timescale 1ns / 1ps

module decoder #(parameter num_regs = 12, instr_width = 9, reg_width = 8, op_width = 4)(
  input        [instr_width-1:0] instruction,
  output logic [op_width-1:0] alu_op, // second operand of alu can be rt, rd, or imm
  output logic [$clog2(num_regs)-1:0] rs_addr, rt_addr, rd_addr,
  output logic [reg_width-1:0] imm, // immediate value for alu
  output logic reg_clear, reg_write, car_write,
  output logic sel_imm, // selector for mux to alu second operand
  output logic jump,
  output logic mem_read, mem_write,
  output logic mem2reg,
  output logic halt);

	always_comb	begin
    // check op code
 	case(instruction[8:6])
	  3'b000 :	begin
        // check subop code
        case(instruction[1:0])
          2'b00 :	begin // AND: R[11] <= R[rs] & R[rt]
            alu_op <= 0;
            rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
            rt_addr <= {{2'b00}, {instruction[3:2]}};
            rd_addr <= 12;
            reg_clear <= 0;
            reg_write <= 1;
            car_write <= 0;
            imm <= 8'bXXXXXXXX;
            sel_imm <= 0;
            jump <= 0;
            mem_write <= 0;
            mem_read <= 0;
            mem2reg <= 0;
            halt <= 0;
          end
          2'b01 :	begin // SLT: R[11] <= R[rs] < R[rt]
            alu_op <= 1;
            rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
            rt_addr <= {{2'b00}, {instruction[3:2]}};
            rd_addr <= 12;
            reg_clear <= 0;
            reg_write <= 1;
            car_write <= 0;
            imm <= 8'bXXXXXXXX;
            sel_imm <= 0;
            jump <= 0;
            mem_write <= 0;
            mem_read <= 0;
            mem2reg <= 0;
            halt <= 0;
          end
          2'b10 :	begin // OR: R[rd] <= R[rs] | R[rt]
            alu_op <= 2;
            rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
            rt_addr <= {{2'b00}, {instruction[3:2]}};
            rd_addr <= 12;
            reg_clear <= 0;
            reg_write <= 1;
            car_write <= 0;
            imm <= 8'bXXXXXXXX;
            sel_imm <= 0;
            jump <= 0;
            mem_write <= 0;
            mem_read <= 0;
            mem2reg <= 0;
            halt <= 0;
          end
          2'b11 :	begin // BEQ
          alu_op <= 7;
          rs_addr <= {{2'b00}, {instruction[5:4]}};
          rt_addr <= {{2'b00}, {instruction[3:2]}} + 8;
          rd_addr <= 4'bXXXX;
          reg_clear <= 0;
          reg_write <= 0;
          car_write <= 0;
          imm <= 8'bXXXXXXXX;
          sel_imm <= 0;
          jump <= 0;
          mem_write <= 0;
          mem_read <= 0;
          mem2reg <= 0;
          halt <= 0;
          end
        endcase
      end
      3'b001 :	begin
      // check subop code
      case(instruction[1:0])
        2'b00 :	begin // LW: R[rt] <= M[R[rs]
          alu_op <= 6;
          rs_addr <= {{2'b00}, {instruction[5:4]}} + 4; // read address from rs
          rt_addr <= 4'bXXXX;
          rd_addr <= {{2'b00}, {instruction[3:2]}};
          reg_clear <= 0;
          reg_write <= 1;
          car_write <= 0;
          imm <= 8'bXXXXXXXX;
          sel_imm <= 0;
          jump <= 0;
          mem_write <= 0;
          mem_read <= 1;
          mem2reg <= 1;
          halt <= 0;
        end
        2'b01 :	begin // SW: M[R[rs]] <= R[rt]
          alu_op <= 6;
          rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
          rt_addr <= {{2'b00}, {instruction[3:2]}};
          rd_addr <= 4'bXXXX;
          reg_clear <= 0;
          reg_write <= 1;
          car_write <= 0;
          imm <= 8'bXXXXXXXX;
          sel_imm <= 0;
          jump <= 0;
          mem_write <= 1;
          mem_read <= 0;
          mem2reg <= 0;
          halt <= 0;
        end
        2'b10 :	begin // INC
          alu_op <= 4;
          rs_addr <= {{2'b00}, {instruction[5:2]}};
          rt_addr <= 4'bXXXX;
          rd_addr <= 4'bXXXX;
          reg_clear <= 0;
          reg_write <= 1;
          car_write <= 0;
          imm <= 8'b00000001;
          sel_imm <= 1;
          jump <= 0;
          mem_write <= 0;
          mem_read <= 0;
          mem2reg <= 0;
          halt <= 0;
        end
        2'b11 :	begin // CLR
          alu_op <= 6;
          rs_addr <= 4'bXXXX;
          rt_addr <= 4'bXXXX;
          rd_addr <= {{2'b00}, {instruction[5:2]}};
          reg_clear <= 1;
          reg_write <= 1;
          car_write <= 0;
          imm <= 8'bXXXXXXXX;
          sel_imm <= 0;
          jump <= 0;
          mem_write <= 0;
          mem_read <= 0;
          mem2reg <= 0;
          halt <= 0;
        end
        default: begin
          // NO OP
        end
      endcase
      end
      3'b010 :	begin // ADD: R[rd] <= R[rs] + R[rt]
        alu_op <= 4;
        rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
        rt_addr <= {{2'b00}, {instruction[3:2]}};
        rd_addr <= {{2'b00}, {instruction[1:0]}} + 8;
        reg_clear <= 0;
        reg_write <= 1;
        car_write <= 1;
        imm <= 8'bXXXXXXXX;
        sel_imm <= 0;
        jump <= 0;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b011 :	begin // ADDI: R[rd] <= R[rt] + imm
        alu_op <= 4;
        rs_addr <= {{2'b00}, {instruction[3:2]}};
        rt_addr <= 4'bXXXX;
        rd_addr <= {{2'b00}, {instruction[5:4]}} + 8;
        reg_clear <= 0;
        reg_write <= 1;
        car_write <= 0;
        imm <= {{6'b000000}, {instruction[1:0]}};
        sel_imm <= 1;
        jump <= 0;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b100 :	begin // SUB: R[rd] <= R[rs] - R[rt]
        alu_op <= 5;
        rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
        rt_addr <= {{2'b00}, {instruction[3:2]}};
        rd_addr <= {{2'b00}, {instruction[1:0]}} + 8;
        reg_clear <= 0;
        reg_write <= 1;
        car_write <= 1;
        imm <= 8'bXXXXXXXX;
        sel_imm <= 0;
        jump <= 0;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b101 :	begin // TR: R[imm2 + 2] <= R[imm2 + 4]
        alu_op <= 6;
        rs_addr <= {{1'b0}, {instruction[2:0]}} + 5; // read lower 8
        rt_addr <=  4'bXXXX;
        rd_addr <= {{1'b0}, {instruction[5:3]}} + 1; // write upper 8
        reg_clear <= 0;
        reg_write <= 1;
        car_write <= 0;
        sel_imm <= 0;
        jump <= 0;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b110 :	begin // JR
        alu_op <= 6;
        rs_addr <= 4'bXXXX;
        rt_addr <=  4'bXXXX;
        rd_addr <= 4'bXXXX;
        reg_clear <= 0;
        reg_write <= 0;
        car_write <= 0;
        imm <= {{2'b00}, {instruction[5:0]}};
        sel_imm <= 0;
        jump <= 1;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b111 :	begin
      // check subop code
      case(instruction[1:0])
        2'b00 :	begin // SRL: logical
          alu_op <= 8;
          rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
          rt_addr <= {{2'b00}, {instruction[3:2]}};
          rd_addr <= {{2'b00}, {instruction[5:4]}} + 4;
          reg_clear <= 0;
          reg_write <= 1;
          car_write <= 1;
          imm <= 8'bXXXXXXXX;
          sel_imm <= 0;
          jump <= 0;
          mem_write <= 0;
          mem_read <= 0;
          mem2reg <= 0;
          halt <= 0;
        end
        2'b01 :	begin // SRA: arithmetic shift
          alu_op <= 9;
          rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
          rt_addr <= {{2'b00}, {instruction[3:2]}};
          rd_addr <= {{2'b00}, {instruction[5:4]}} + 4;
          reg_clear <= 0;
          reg_write <= 1;
          car_write <= 1;
          imm <= 8'bXXXXXXXX;
          sel_imm <= 0;
          jump <= 0;
          mem_write <= 0;
          mem_read <= 0;
          mem2reg <= 0;
          halt <= 0;
        end
        2'b10 :	begin // SLL:
          alu_op <= 10;
          rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;
          rt_addr <= {{2'b00}, {instruction[3:2]}};
          rd_addr <= {{2'b00}, {instruction[5:4]}} + 4;
          reg_clear <= 0;
          reg_write <= 1;
          car_write <= 1;
          imm <= 8'bXXXXXXXX;
          sel_imm <= 0;
          jump <= 0;
          mem_write <= 0;
          mem_read <= 0;
          mem2reg <= 0;
          halt <= 0;
        end
        2'b11 :	begin // HALT
          alu_op <= 4'bXXXX;
          rs_addr <= 8'bXXXXXXXX;
          rt_addr <= 8'bXXXXXXXX;
          rd_addr <= 8'bXXXXXXXX;
          reg_clear <= 0;
          reg_write <= 0;
          car_write <= 0;
          sel_imm <= 0;
          jump <= 0;
          mem_write <= 0;
          mem_read <= 0;
          mem2reg <= 0;
          halt <= 1;
        end
        default: begin
          // NO OP
        end
        endcase
        end
      endcase
      end

endmodule
