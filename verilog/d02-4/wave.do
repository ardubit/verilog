onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group inputs
add wave -noupdate -group inputs -format Logic /testbench_mux/a
add wave -noupdate -group inputs -format Logic /testbench_mux/b
add wave -noupdate -group inputs -format Logic /testbench_mux/c
add wave -noupdate -group inputs -format Logic /testbench_mux/d
add wave -noupdate -expand -group select
add wave -noupdate -group select -format Logic /testbench_mux/s1
add wave -noupdate -group select -format Logic /testbench_mux/s0
add wave -noupdate -expand -group {output Y}
add wave -noupdate -group {output Y} -format Logic -radix binary /testbench_mux/y1
add wave -noupdate -group {output Y} -format Logic -radix binary /testbench_mux/y2
add wave -noupdate -group {output Y} -format Logic -radix binary /testbench_mux/y3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 189
configure wave -valuecolwidth 55
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
WaveRestoreZoom {0 ns} {85 ns}
