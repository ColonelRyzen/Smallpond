
proc vunit_load {} {
    set vunit_generic_runner_cfg {active python runner : true,enabled_test_cases : ,output path : C::/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/vunit/vunit_out/test_output/lib.tb_example.all_7b5933c73ddb812488c059080644e9fd58c418d9/,tb path : C::/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/vunit/,use_color : true}
    set vsim_failed [catch {
        vsim  -g/tb_example/runner_cfg=${vunit_generic_runner_cfg} -lib lib tb_example tb 
    }]
    if {${vsim_failed}} {
        return 1
    }

    global breakassertlevel
    set breakassertlevel 2

    global builtinbreakassertlevel
    set builtinbreakassertlevel $breakassertlevel

    set no_vhdl_test_runner_exit [catch {examine /run_pkg/runner.exit_without_errors}]
    if {${no_vhdl_test_runner_exit}}  {
        echo {Error: No vunit test runner package used}
        return 1
    }
    return 0
}

proc vunit_run {} {
    set has_vhdl_runner [expr ![catch {examine /run_pkg/runner}]]

    if {${has_vhdl_runner}} {
        set status_boolean "/run_pkg/runner.exit_without_errors"
        set true_value true
    } else {
        echo "No finish mechanism detected"
        return 1;
    }

    run -all
    set failed [expr [examine ${status_boolean}]!=${true_value}]
    if {$failed} {
        catch {
            # tb command can fail when error comes from pli
            echo ""
            echo "Stack trace result from 'bt' command"
            bt
        }
    }
    return $failed
}
