module program_counter #(parameter instruction_width = 9, parameter size = 256)
                 (input clk 
				 ,input start
				 ,input start_address[instruction_width-1:0]
				 ,input branch
				 ,input taken
				 ,input target[instruction_width-1:0]
                 ,output curr_instruction[instruction_width-1:0]
                 );

reg[instruction_width-1:0] curr_instruction1;

assign curr_instruction = curr_instruction1;

always_ff @ (posedge clk)
begin
    if (start) begin
		curr_instruction1 <= start_address;
	end
	else if (branch && taken)
		curr_instruction1 <= target;
    else
		curr_instruction1 <= curr_instruction1 + 1;  
end
  
endmodule
