onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/DUT/clk
add wave -noupdate /top_tb/DUT/start
add wave -noupdate /top_tb/DUT/halt
add wave -noupdate /top_tb/DUT/instruction
add wave -noupdate /top_tb/DUT/alu_op
add wave -noupdate /top_tb/DUT/rs_addr
add wave -noupdate /top_tb/DUT/rt_addr
add wave -noupdate /top_tb/DUT/rd_addr
add wave -noupdate /top_tb/DUT/imm
add wave -noupdate /top_tb/DUT/reg_read
add wave -noupdate /top_tb/DUT/reg_write
add wave -noupdate /top_tb/DUT/car_write
add wave -noupdate /top_tb/DUT/sel_imm
add wave -noupdate /top_tb/DUT/branch
add wave -noupdate /top_tb/DUT/mem_read
add wave -noupdate /top_tb/DUT/mem_write
add wave -noupdate /top_tb/DUT/mem2reg
add wave -noupdate /top_tb/DUT/rt_out
add wave -noupdate /top_tb/DUT/rs_out
add wave -noupdate /top_tb/DUT/res_out
add wave -noupdate /top_tb/DUT/car_out
add wave -noupdate /top_tb/DUT/REG/car_in
add wave -noupdate /top_tb/DUT/mem_out
add wave -noupdate /top_tb/DUT/instr_count
add wave -noupdate /top_tb/DUT/start_addr
add wave -noupdate /top_tb/DUT/rb_in
add wave -noupdate /top_tb/DUT/rd_in
add wave -noupdate /top_tb/DUT/REG/reg_write
add wave -noupdate /top_tb/DUT/REG/car_write
add wave -noupdate /top_tb/DUT/REG/rt_addr
add wave -noupdate /top_tb/DUT/REG/rs_addr
add wave -noupdate /top_tb/DUT/REG/rd_addr
add wave -noupdate /top_tb/DUT/REG/rd_in
add wave -noupdate /top_tb/DUT/REG/rt_out
add wave -noupdate /top_tb/DUT/REG/rs_out
add wave -noupdate -expand /top_tb/DUT/REG/regs
add wave -noupdate /top_tb/DUT/ALU/ra_in
add wave -noupdate /top_tb/DUT/ALU/rb_in
add wave -noupdate /top_tb/DUT/ALU/op
add wave -noupdate /top_tb/DUT/ALU/res_out
add wave -noupdate /top_tb/DUT/ALU/car_out
add wave -noupdate /top_tb/DUT/ALU/zero
add wave -noupdate /top_tb/DUT/ALU/jump
add wave -noupdate /top_tb/DUT/IF/pc_out
add wave -noupdate /top_tb/DUT/IF/target
add wave -noupdate -expand /top_tb/DUT/RAM/my_memory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1164606 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1159549 ps} {1597125 ps}
