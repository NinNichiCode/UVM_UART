# ================================================================
# Makefile - UVM UART Regression with Questa
# ================================================================

LIB = work_A

RTL_DIR = ../
TB_DIR  = ../tb
UVC_DIR = ../uvc

INCDIRS = \
	+incdir+$(UVC_DIR)/env \
	+incdir+$(UVC_DIR)/seq \
	+incdir+$(UVC_DIR)/tests

TESTS = rand_baud_len8_test \
	rand_baud_len7_test \
	rand_baud_len6_test \
	rand_baud_len5_test \
	rand_baud_len5p_test \
	rand_baud_len6p_test \
	rand_baud_len7p_test \
	rand_baud_len8p_test \
	rand_baud_test \
	rand_baud_with_2_stop_test \
	uart_test
	

# ================================================================
all: compile regress coverage summary

# ================================================================
compile:
	@echo "==== COMPILING ===="
	vlib $(LIB)
	vmap work $(LIB)

	vlog -work work -sv -cover bcetf $(TB_DIR)/uart_if.sv $(RTL_DIR)/uart.v

	vlog -work work -sv -cover bcetf $(INCDIRS) $(UVC_DIR)/env/uart_pkg.sv

	vlog -work work -sv -cover bcetf $(TB_DIR)/top.sv

# ================================================================
regress:
	@echo "==== RUNNING REGRESSION ===="
	@mkdir -p logs
	@mkdir -p cov
	@for t in $(TESTS); do \
	vsim -c -coverage top +UVM_TESTNAME=$$t -voptargs="+acc" -l logs/$$t.log -do "coverage save -onexit cov/$$t.ucdb; run -all; quit "; \
	done

coverage:
	@echo "==== MERGING COVERAGE ===="
	# Xóa file merged cũ nếu có để tránh lỗi trùng tên test data
	rm -f cov/merged.ucdb
	# Merge tất cả các file ucdb lẻ thành file merged.ucdb
	vcover merge cov/merged.ucdb cov/*.ucdb
	vcover report -html cov/merged.ucdb -htmldir cov/html
	vcover report -details -file cov/coverage.txt cov/merged.ucdb

# ================================================================
summary:
	@echo ""
	@echo "========== REGRESSION SUMMARY =========="
	@echo "PASS:"
	@grep -l "TEST PASSED" logs/*.log | sed 's#.*/##'
	@echo ""
	@echo "FAIL:"
	@grep -L "TEST PASSED" logs/*.log | sed 's#.*/##'
	@echo "======================================="

# ================================================================
clean:
	rm -rf $(LIB) transcript logs *.log cov modelsim.ini

.PHONY: all compile regress coverage summary clean


