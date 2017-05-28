`timescale 1ns / 1ps
module decoder #(parameter num_regs = 12, instr_width = 9)(

  input        [8:0] instruction,
  output logic [1:0] alu_op, // second operand of alu can be rt, rd, or imm
  output logic [$clog2(num_regs)-1:0] rs_addr, rt_addr, rd_addr,
  output logic [2:0] imm, // immediate value for alu
  output logic reg_read, reg_write,
  output logic sel_imm, // selector for mux to alu second operand
  output logic branch,
  output logic mem_read, mem_write,
  output logic mem2reg,
  output logic halt);

	always_comb	begin
    // check op code
	  case(instruction[8:6])
	  	3'b000 :	begin
        // check subop code
        case(instruction[1:0])
          2'b00 :	begin // AND: R[rd] <= R[rs] & R[rt]
            alu_op <= 0;
            rs_addr <= {{2'b00}, {instruction[5:4]}};
            rt_addr <= {{2'b00}, {instruction[3:2]}} + 4;
            rd_addr <= 11;
            reg_read <= 1;
            reg_write <= 1;
            imm <= 3'bXXX;
            sel_imm <= 0;
            branch <= 0;
            mem_write <= 0;
            mem_read <= 0;
            mem2reg <= 0;
            halt <= 0;
          end
          2'b01 :	begin // SLT: R[rd] <= R[rs] < R[rt]
            alu_op <= 1;
            rs_addr <= {{2'b00}, {instruction[5:4]}};
            rt_addr <= {{2'b00}, {instruction[3:2]}} + 4;
            rd_addr <= 11;
            reg_read <= 1;
            reg_write <= 1;
            imm <= 3'bXXX;
            sel_imm <= 0;
            branch <= 0;
            mem_write <= 0;
            mem_read <= 0;
            mem2reg <= 0;
            halt <= 0;
          end
          2'b10 :	begin // OR: R[rd] <= R[rs] | R[rt]
            alu_op <= 2;
            rs_addr <= {{2'b00}, {instruction[5:4]}};
            rt_addr <= {{2'b00}, {instruction[3:2]}} + 4;
            rd_addr <= 11;
            reg_read <= 1;
            reg_write <= 1;
            imm <= 3'bXXX;
            sel_imm <= 0;
            branch <= 0;
            mem_write <= 0;
            mem_read <= 0;
            mem2reg <= 0;
            halt <= 0;
          end
          2'b11 :	begin // JR: R[rs] <= R[rs]
            alu_op <= 6;
              rs_addr <= {{2'b00}, {instruction[5:4]}};
            rt_addr <= {{2'b00}, {instruction[3:2]}} + 4;
            rd_addr <= 11;
            reg_read <= 1;
            reg_write <= 1;
            imm <= 3'bXXX;
            sel_imm <= 0;
            branch <= 0;
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
        2'b00 :	begin // LW: R[rs] <= M[R[rd]]
          alu_op <= 6;
          rs_addr <= {{2'b00}, {instruction[3:2]}} + 4; // read address from rd
          rt_addr <= 8'bXXXXXXXX;
          rd_addr <= {{2'b00}, {instruction[5:4]}}; // write to rs
          reg_read <= 1;
          reg_write <= 1;
          imm <= 3'bXXX;
          sel_imm <= 0;
          branch <= 0;
          mem_write <= 0;
          mem_read <= 1;
          mem2reg <= 1;
          halt <= 0;
        end
        2'b01 :	begin // SW: M[R[rs]] <= R[rd]
          alu_op <= 1;
          rs_addr <= {{2'b00}, {instruction[5:4]}};
          rt_addr <= {{2'b00}, {instruction[3:2]}} + 4;
          rd_addr <= 11;
          reg_read <= 1;
          reg_write <= 1;
          imm <= 3'bXXX;
          sel_imm <= 0;
          branch <= 0;
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
        alu_op <= 3;
        rs_addr <= {{2'b00}, {instruction[5:4]}};
        rt_addr <= {{2'b00}, {instruction[3:2]}} + 4;
        rd_addr <= {{2'b00}, {instruction[1:0]}} + 8;
        reg_read <= 1;
        reg_write <= 1;
        imm <= 3'bXXX;
        sel_imm <= 0;
        branch <= 0;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b011 :	begin // ADDI: R[rd] <= R[rs] + imm
        alu_op <= 3;
        rs_addr <= {{2'b00}, {instruction[5:4]}};
        rt_addr <=  8'bXXXXXXXX;
        rd_addr <= {{2'b00}, {instruction[3:2]}} + 8;
        reg_read <= 1;
        reg_write <= 1;
        imm <= instruction[3:2];
        sel_imm <= 0;
        branch <= 0;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b100 :	begin // TR1: R[imm1] <= R[imm2]
        alu_op <= 6;
        rs_addr <= {{1'b0}, {instruction[2:0]}} + 4;
        rt_addr <= 8'bXXXXXXXX;
        rd_addr <= {{1'b0}, {instruction[5:3]}};
        reg_read <= 1;
        reg_write <= 1;
        sel_imm <= 0;
        branch <= 0;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b100 :	begin // TR2: R[imm1] <= R[imm2]
        alu_op <= 6;
        rs_addr <= {{1'b0}, {instruction[5:3]}};
        rt_addr <= 8'bXXXXXXXX;
        rd_addr <= {{1'b0}, {instruction[2:0]}} + 4;
        reg_read <= 1;
        reg_write <= 1;
        sel_imm <= 0;
        branch <= 0;
        mem_write <= 0;
        mem_read <= 0;
        mem2reg <= 0;
        halt <= 0;
      end
      3'b111 :	begin // HALT
        alu_op <= 1'bX;
        rs_addr <= 8'bXXXXXXXX;
        rt_addr <= 8'bXXXXXXXX;
        rd_addr <= 8'bXXXXXXXX;
        reg_read <= 0;
        reg_write <= 0;
        sel_imm <= 0;
        branch <= 0;
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

endmodule
