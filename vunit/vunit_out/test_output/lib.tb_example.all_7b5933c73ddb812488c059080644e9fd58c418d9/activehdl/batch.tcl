source "C:/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/vunit/vunit_out/test_output/lib.tb_example.all_7b5933c73ddb812488c059080644e9fd58c418d9/activehdl/common.tcl"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
