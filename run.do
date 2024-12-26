vlib work
vlog +incdir+C:/Users/panda/OneDrive/Desktop/uvm-1.2/src top.sv
#ellaboration + mapping uvm dpi
vsim -novopt -suppress 12110 top -sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi +UVM_TESTNAME=mem_base_test +UVM_MAX_QUIT_COUNT=10
coverage save -onexit fifo_base_test.ucdb
#ADD WAVEFORM
add wave -position insertpoint sim:/top/dut/*
run -all
