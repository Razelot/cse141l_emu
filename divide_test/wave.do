onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /division_tb/DUT/IF/instr_out
add wave -noupdate /division_tb/DUT/REG/rt_addr
add wave -noupdate /division_tb/DUT/REG/rs_addr
add wave -noupdate /division_tb/DUT/REG/rd_addr
add wave -noupdate /division_tb/DUT/REG/rd_in
add wave -noupdate /division_tb/DUT/REG/car_in
add wave -noupdate /division_tb/DUT/REG/rt_out
add wave -noupdate /division_tb/DUT/REG/rs_out
add wave -noupdate /division_tb/DUT/REG/rd_out
add wave -noupdate -expand /division_tb/DUT/REG/core
add wave -noupdate /division_tb/DUT/REG/allow_write
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {212304 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
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
WaveRestoreZoom {2064061382 ps} {2064128349 ps}
