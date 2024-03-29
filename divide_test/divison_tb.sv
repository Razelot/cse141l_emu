`timescale 1ns / 1ps

module division_tb;

bit  signed [15:0] dividend;
bit  signed [ 7:0] divisor;
wire signed [15:0] quotient_beh;
logic signed [15:0] quotient_DUT;
bit          clk, start;
wire         done;
bit  [7:0] score;            // how many correct trials

// be sure to substitute the name of your top_level module here
// also, substitute names of your ports, as needed
top_level DUT(
  .clk   (clk),
  .start (start),
  .done  (done)
  );

// behavioral model to match
divison DUT1(
	dividend,divisor,quotient_beh
   );

initial begin
  #10ns  start = 1'b1;
  #10ns for (int i=0; i<256; i++)		 // clear data memory
	      DUT.RAM.core[i] = 8'b0;
// you may preload any desired constants into your RAM here
//    ...
// case 1
  dividend = 16'h1000;
  divisor = 8'h10;
  DUT.RAM.core[128] = 8'h10;
  DUT.RAM.core[129] = 8'h00;
  DUT.RAM.core[130] = 8'h10;

// clear reg. file -- you may load any constants you wish here
  for(int i=0; i<16; i++)
	DUT.REG.core[i] = 8'b0;
// load instruction ROM	-- unfilled elements will get x's -- should be harmless
  // $readmemb("instr.txt",DUT.instr_rom.core);
//  monitor ("dividend=%d,divisor=%d,quotient=%d", dividend, divisor, quotient);
  #10ns start = 1'b0;
  #100ns wait(done);
  #10ns  quotient_DUT = {DUT.RAM.core[126],DUT.RAM.core[127]};
  #10ns  $display(quotient_beh,quotient_DUT);
  if(quotient_beh == quotient_DUT)	 // score another successful trial
    score++;

// case 2
  #10ns  start = 1'b1;
  #10ns dividend = 16'h7FFF;
  divisor = 8'h7F;
  DUT.RAM.core[128] = dividend[15:8];
  DUT.RAM.core[129] = dividend[ 7:0];
  DUT.RAM.core[130] = divisor;

// clear reg. file -- you may load any constants you wish here
  for(int i=0; i<16; i++)
	DUT.REG.core[i] = 8'b0;
// load instruction ROM	-- unfilled elements will get x's -- should be harmless
  // $readmemb("instr.txt",DUT.instr_rom.core);
//  monitor ("dividend=%d,divisor=%d,quotient=%d", dividend, divisor, quotient);
  #10ns start = 1'b0;
  #100ns wait(done);
  #10ns  quotient_DUT = {DUT.RAM.core[126],DUT.RAM.core[127]};
  #10ns  $display(quotient_beh,quotient_DUT);
  if(quotient_beh == quotient_DUT)	 // score another successful trial
    score++;

// case 3
  #10ns  start = 1'b1;
  #10ns dividend = 16'h6F;
  divisor = 8'h70;
  DUT.RAM.core[128] = dividend[15:8];
  DUT.RAM.core[129] = dividend[ 7:0];
  DUT.RAM.core[130] = divisor;

// clear reg. file -- you may load any constants you wish here
  for(int i=0; i<16; i++)
	DUT.REG.core[i] = 8'b0;
// load instruction ROM	-- unfilled elements will get x's -- should be harmless
  // $readmemb("instr.txt",DUT.instr_rom.core);
//  monitor ("dividend=%d,divisor=%d,quotient=%d", dividend, divisor, quotient);
  #10ns start = 1'b0;
  #100ns wait(done);
  #10ns  quotient_DUT = {DUT.RAM.core[126],DUT.RAM.core[127]};
  #10ns  $display(quotient_beh,quotient_DUT);
  if(quotient_beh == quotient_DUT)	 // score another successful trial
    score++;

// case 4
  #10ns  start = 1'b1;
  #10ns dividend = 16'h100;
  divisor = 8'h10;
  DUT.RAM.core[128] = dividend[15:8];
  DUT.RAM.core[129] = dividend[ 7:0];
  DUT.RAM.core[130] = divisor;

// clear reg. file -- you may load any constants you wish here
  for(int i=0; i<16; i++)
	DUT.REG.core[i] = 8'b0;
// load instruction ROM	-- unfilled elements will get x's -- should be harmless
  // $readmemb("instr.txt",DUT.instr_rom.core);
//  monitor ("dividend=%d,divisor=%d,quotient=%d", dividend, divisor, quotient);
  #10ns start = 1'b0;
  #100ns wait(done);
  #10ns  quotient_DUT = {DUT.RAM.core[126],DUT.RAM.core[127]};
  #10ns  $display(quotient_beh,quotient_DUT);
  if(quotient_beh == quotient_DUT)	 // score another successful trial
    score++;

// case 5
  #10ns  start = 1'b1;
  #10ns dividend = 16'h5A5A;
  divisor = 8'h78;
  DUT.RAM.core[128] = dividend[15:8];
  DUT.RAM.core[129] = dividend[ 7:0];
  DUT.RAM.core[130] = divisor;

// clear reg. file -- you may load any constants you wish here
  for(int i=0; i<16; i++)
	DUT.REG.core[i] = 8'b0;
// load instruction ROM	-- unfilled elements will get x's -- should be harmless
  // $readmemb("instr.txt",DUT.instr_rom.core);
//  monitor ("dividend=%d,divisor=%d,quotient=%d", dividend, divisor, quotient);
  #10ns start = 1'b0;
  #100ns wait(done);
  #10ns  quotient_DUT = {DUT.RAM.core[126],DUT.RAM.core[127]};
  #10ns  $display(quotient_beh,quotient_DUT);
  if(quotient_beh == quotient_DUT)	 // score another successful trial
    score++;



	#10ns	$stop;
end

always begin
  #5ns  clk = 1'b1;
  #5ns  clk = 1'b0;
end

endmodule
