//This is the ALU module of the core, op_code_e is defined in definitions.v file
`include "definitions.sv"

module alu (input  [7:0] rs_i
           ,input  [7:0] rt_i
           ,input  [1:0] im_i
           ,input  instruction_s op_i
           ,output logic [7:0] result_o
           ,output logic jump_now_o
           ,output logic carry_o
           );

	logic [7:0] carry;
	logic [7:0] mask;
always_comb
  begin
    jump_now_o = 1'bx;
    result_o   = 8'dx;
    carry = 8'bx;
    carry = carry_o;

    unique casez (op_i)
      `kAND:   result_o   = rs_i & rt_i;
      `kSLT:   result_o   = ($signed(rs_i)<$signed(rt_i))     ? 8'd1 : 8'd0;
      `kOR:    result_o   = rs_i | rt_i;
      `kADDU:  result_o   = rs_i +  rt_i;
               assign carry = (127-rs_i <= rt_i) ? 1'b1 : 1'b0; //if true means overflow
      `kADDI:  result_o   = rs_i + im_i;
      `kSRLV:
              carry = 'b11111111;
              carry = carry << im_i;
              carry = ~carry;
              carry = carry & rs_i;
              carry = carry << (8-im_i);
              result_o   = $unsigned (rs_i) >>  im_i;

      `kSRAV:
              carry = 'b11111111;
              carry = carry << im_i;
              carry = ~carry;
              carry = carry & rs_i;
              carry = carry << (8-im_i);
              result_o   = $unsigned (rs_i) >>  im_i;
              result_o   = $signed (rs_i) >>>  rt_i;
      `kBEQZ:  jump_now_o = (rs_i==rt_i) ? 1'b1  : 1'b0;

      `kMOV, `kLW, `kSW, `kJALR, `kBAR:
               result_o   = rs_i;

      default:
        begin
          result_o   = 7'dX;
          jump_now_o = 1'bX;
        end
    endcase
  end

endmodule
