onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /division_tb/DUT/IF/pc_out
add wave -noupdate /division_tb/DUT/IF/instr_out
add wave -noupdate /division_tb/DUT/REG/rt_addr
add wave -noupdate /division_tb/DUT/REG/rs_addr
add wave -noupdate /division_tb/DUT/REG/rd_addr
add wave -noupdate /division_tb/DUT/REG/rd_in
add wave -noupdate /division_tb/DUT/REG/car_in
add wave -noupdate /division_tb/DUT/REG/rt_out
add wave -noupdate /division_tb/DUT/REG/rs_out
add wave -noupdate /division_tb/DUT/REG/rd_out
add wave -noupdate -childformat {{{/division_tb/DUT/REG/core[12]} -radix unsigned} {{/division_tb/DUT/REG/core[11]} -radix unsigned} {{/division_tb/DUT/REG/core[10]} -radix unsigned} {{/division_tb/DUT/REG/core[9]} -radix unsigned} {{/division_tb/DUT/REG/core[8]} -radix unsigned} {{/division_tb/DUT/REG/core[7]} -radix unsigned} {{/division_tb/DUT/REG/core[6]} -radix unsigned} {{/division_tb/DUT/REG/core[5]} -radix unsigned} {{/division_tb/DUT/REG/core[4]} -radix unsigned} {{/division_tb/DUT/REG/core[3]} -radix unsigned} {{/division_tb/DUT/REG/core[2]} -radix unsigned} {{/division_tb/DUT/REG/core[1]} -radix unsigned} {{/division_tb/DUT/REG/core[0]} -radix unsigned}} -expand -subitemconfig {{/division_tb/DUT/REG/core[12]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[11]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[10]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[9]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[8]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[7]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[6]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[5]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[4]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[3]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[2]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[1]} {-height 15 -radix unsigned} {/division_tb/DUT/REG/core[0]} {-height 15 -radix unsigned}} /division_tb/DUT/REG/core
add wave -noupdate /division_tb/DUT/REG/allow_write
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {29454 ps} 0}
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
WaveRestoreZoom {0 ps} {66967 ps}
