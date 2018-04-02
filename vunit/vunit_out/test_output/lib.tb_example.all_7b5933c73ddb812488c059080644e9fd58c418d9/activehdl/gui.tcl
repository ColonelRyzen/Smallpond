source "C:/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/vunit/vunit_out/test_output/lib.tb_example.all_7b5933c73ddb812488c059080644e9fd58c418d9/activehdl/common.tcl"
workspace create workspace
design create -a design .
vmap vunit_lib C:/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/vunit/vunit_out/activehdl/libraries/vunit_lib
vmap lib C:/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/vunit/vunit_out/activehdl/libraries/lib
vunit_load
puts "VUnit help: Design already loaded. Use run -all to run the test."
