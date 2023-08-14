onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group struct
add wave -noupdate -group struct -format Logic -radix binary /testbench_demux/a1
add wave -noupdate -group struct -format Logic -radix binary /testbench_demux/b1
add wave -noupdate -group struct -format Logic -radix binary /testbench_demux/c1
add wave -noupdate -group struct -format Logic -radix binary /testbench_demux/d1
add wave -noupdate -expand -group {data flow}
add wave -noupdate -group {data flow} -format Logic -radix binary /testbench_demux/a2
add wave -noupdate -group {data flow} -format Logic -radix binary /testbench_demux/b2
add wave -noupdate -group {data flow} -format Logic -radix binary /testbench_demux/c2
add wave -noupdate -group {data flow} -format Logic -radix binary /testbench_demux/d2
add wave -noupdate -expand -group funct
add wave -noupdate -group funct -format Logic -radix binary /testbench_demux/a3
add wave -noupdate -group funct -format Logic -radix binary /testbench_demux/b3
add wave -noupdate -group funct -format Logic -radix binary /testbench_demux/c3
add wave -noupdate -group funct -format Logic -radix binary /testbench_demux/d3
add wave -noupdate -expand -group select
add wave -noupdate -group select -format Logic -radix binary /testbench_demux/s1
add wave -noupdate -group select -format Logic /testbench_demux/s0
add wave -noupdate -format Logic -radix binary /testbench_demux/y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16 ns} 0}
configure wave -namecolwidth 177
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
WaveRestoreZoom {0 ns} {42 ns}
