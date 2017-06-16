onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cordic_tb/DUT/DEC/instruction
add wave -noupdate -radix unsigned /cordic_tb/DUT/IF/pc_out
add wave -noupdate /cordic_tb/DUT/REG/car_in
add wave -noupdate /cordic_tb/DUT/REG/core
add wave -noupdate /cordic_tb/DUT/REG/rd_addr
add wave -noupdate /cordic_tb/DUT/REG/rd_in
add wave -noupdate /cordic_tb/DUT/REG/rd_out
add wave -noupdate /cordic_tb/DUT/REG/rs_addr
add wave -noupdate /cordic_tb/DUT/REG/rs_out
add wave -noupdate /cordic_tb/DUT/REG/rt_addr
add wave -noupdate /cordic_tb/DUT/REG/rt_out
add wave -noupdate /cordic_tb/DUT/RAM/core
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {288547 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
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
WaveRestoreZoom {7189843623 ps} {7189902968 ps}
