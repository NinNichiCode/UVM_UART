
if {[file isdirectory work]} {
    vdel -all
}
vlib work

echo "--- Compiling RTL ---"
vlog -sv ../tb/uart_if.sv ../uart.v



echo "--- Compiling UVC Package ---"
# Thêm đường dẫn tìm file include
vlog -sv +incdir+../uvc/env +incdir+../uvc/seq +incdir+../uvc/tests ../uvc/env/uart_pkg.sv



echo "--- Compiling Top Module ---"
vlog -sv ../tb/top.sv

echo "--- Compilation successful! ---"

echo "--- Starting Simulation ---"
# Simulation: ---------------------------------------------------------

vsim top +UVM_TESTNAME=rand_baud_test
vsim top +UVM_TESTNAME=uart_test
vsim top +UVM_TESTNAME=rand_baud_with_2_stop_test
vsim top +UVM_TESTNAME=rand_baud_len5p_test
vsim top +UVM_TESTNAME=rand_baud_len6p_test
vsim top +UVM_TESTNAME=rand_baud_len7p_test
vsim top +UVM_TESTNAME=rand_baud_len8p_test

vsim top +UVM_TESTNAME=rand_baud_len5_test
vsim top +UVM_TESTNAME=rand_baud_len6_test
vsim top +UVM_TESTNAME=rand_baud_len7_test
vsim top +UVM_TESTNAME=rand_baud_len8_test

# Coverage report: ----------------------------------------------------
# Coverage save ucdb file:
# coverage save -onexit -assert -directive -cvg -codeAll directed_test.ucdb

# Coverage reports with html and text files:
# vcover report -html directed_test.ucdb -htmldir covhtmlreport
# vcover report -file cov_report.txt directed_test.ucdb

add wave -r /*

run -all

