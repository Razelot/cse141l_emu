`timescale 1ns / 1ps

module decoder #(parameter num_regs = 12, instr_width = 9, reg_width = 8 )(



  input        [8:0] instruction,

  output logic [1:0] alu_op, // second operand of alu can be rt, rd, or imm

  output logic [$clog2(num_regs)-1:0] rs_addr, rt_addr, rd_addr,

  output logic [reg_width-1:0] imm, // immediate value for alu

  output logic reg_read, reg_write,

  output logic sel_imm, // selector for mux to alu second operand

  // output logic branch,

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

            rd_addr <= 11;

            reg_read <= 1;

            reg_write <= 1;

            imm <= 8'bXXXXXXXX;

            sel_imm <= 0;

            // branch <= 0;

            mem_write <= 0;

            mem_read <= 0;

            mem2reg <= 0;

            halt <= 0;

          end

          2'b01 :	begin // SLT: R[11] <= R[rd] < R[rt]

            alu_op <= 1;

            rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;

            rt_addr <= {{2'b00}, {instruction[3:2]}} + 8;

            rd_addr <= 11;

            reg_read <= 1;

            reg_write <= 1;

            imm <= 8'bXXXXXXXX;

            sel_imm <= 0;

            // branch <= 0;

            mem_write <= 0;

            mem_read <= 0;

            mem2reg <= 0;

            halt <= 0;

          end

          2'b10 :	begin // OR: R[rd] <= R[rs] | R[rt]

            alu_op <= 2;

            rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;

            rt_addr <= {{2'b00}, {instruction[3:2]}};

            rd_addr <= 11;

            reg_read <= 1;

            reg_write <= 1;

            imm <= 8'bXXXXXXXX;

            sel_imm <= 0;

            // branch <= 0;

            mem_write <= 0;

            mem_read <= 0;

            mem2reg <= 0;

            halt <= 0;

          end

          2'b11 :	begin // JR: R[rs] <= R[rs]

            alu_op <= 5;

            rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;

            rt_addr <= {{2'b00}, {instruction[3:2]}};

            rd_addr <= 11;

            reg_read <= 1;

            reg_write <= 1;

            imm <= 8'bXXXXXXXX;

            sel_imm <= 0;

            // branch <= 0;

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

        2'b00 :	begin // LW: R[rs] <= M[R[rt]

          alu_op <= 6;

          rs_addr <= {{2'b00}, {instruction[5:4]}} + 4; // read address from rt

          rt_addr <= 4'bXXXX;

          rd_addr <= {{2'b00}, {instruction[3:2]}};

          reg_read <= 1;

          reg_write <= 1;

          imm <= 8'bXXXXXXXX;

          sel_imm <= 0;

          // branch <= 0;

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

          reg_read <= 1;

          reg_write <= 1;

          imm <= 8'bXXXXXXXX;

          sel_imm <= 0;

          // branch <= 0;

          mem_write <= 1;

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

        reg_read <= 1;

        reg_write <= 1;

        imm <= 8'bXXXXXXXX;

        sel_imm <= 0;

        // branch <= 0;

        mem_write <= 0;

        mem_read <= 0;

        mem2reg <= 0;

        halt <= 0;

      end

      3'b011 :	begin // ADDI: R[rd] <= R[rt] + imm

        alu_op <= 4;

        rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;

        rt_addr <= 4'bXXXX;

        rd_addr <= {{2'b00}, {instruction[1:0]}};

        reg_read <= 1;

        reg_write <= 1;

        imm <= {{6'b000000}, {instruction[1:0]}};

        sel_imm <= 1;

        // branch <= 0;

        mem_write <= 0;

        mem_read <= 0;

        mem2reg <= 0;

        halt <= 0;

      end

      3'b110 :	begin // SUB: R[rd] <= R[rs] - R[rt]

        alu_op <= 5;

        rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;

        rt_addr <= {{2'b00}, {instruction[3:2]}};

        rd_addr <= {{2'b00}, {instruction[1:0]}} + 8;

        reg_read <= 1;

        reg_write <= 1;

        imm <= 8'bXXXXXXXX;

        sel_imm <= 0;

        // branch <= 0;

        mem_write <= 0;

        mem_read <= 0;

        mem2reg <= 0;

        halt <= 0;

      end

      3'b100 :	begin // TR: R[imm2 + 2] <= R[imm2 + 4]

        alu_op <= 6;

        rs_addr <= {{3'b00}, {instruction[2:0]}} + 4; // read lower 8

        rt_addr <=  4'bXXXX;

        rd_addr <= {{3'b00}, {instruction[5:3]}}; // write upper 8

        reg_read <= 1;

        reg_write <= 1;

        sel_imm <= 0;

        // branch <= 0;

        mem_write <= 0;

        mem_read <= 0;

        mem2reg <= 0;

        halt <= 0;

      end

      3'b110 :	begin // BEQ:

        alu_op <= 7;

        rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;

        rt_addr <= {{2'b00}, {instruction[3:2]}};

        rd_addr <= 4'bXXXX;

        reg_read <= 1;

        reg_write <= 0;

        imm <= 8'bXXXXXXXX;

        sel_imm <= 0;

        // branch <= 0;

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

          reg_read <= 1;

          reg_write <= 1;

          imm <= 8'bXXXXXXXX;

          sel_imm <= 0;

          // branch <= 0;

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

          reg_read <= 1;

          reg_write <= 1;

          imm <= 8'bXXXXXXXX;

          sel_imm <= 0;

          // branch <= 0;

          mem_write <= 0;

          mem_read <= 0;

          mem2reg <= 0;

          halt <= 0;

        end

        2'b01 :	begin // SLL:

          alu_op <= 10;

          rs_addr <= {{2'b00}, {instruction[5:4]}} + 4;

          rt_addr <= {{2'b00}, {instruction[3:2]}};

          rd_addr <= {{2'b00}, {instruction[5:4]}} + 4;

          reg_read <= 1;

          reg_write <= 1;

          imm <= 8'bXXXXXXXX;

          sel_imm <= 0;

          // branch <= 0;

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

          reg_read <= 0;

          reg_write <= 0;

          sel_imm <= 0;

          // branch <= 0;

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
