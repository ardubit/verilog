onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /testbench_lab1/a
add wave -noupdate -format Logic /testbench_lab1/b
add wave -noupdate -format Logic /testbench_lab1/c
add wave -noupdate -format Logic /testbench_lab1/d
add wave -noupdate -format Logic /testbench_lab1/y1
add wave -noupdate -format Logic /testbench_lab1/y2
add wave -noupdate -format Logic /testbench_lab1/y3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 150
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
configure wave -timelineunits ns
update
WaveRestoreZoom {61 ns} {198 ns}
