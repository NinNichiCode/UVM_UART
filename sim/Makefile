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

TESTS = 	rand_baud_len8_test

# ================================================================
all: compile regress summary

# ================================================================
compile:
	@echo "==== COMPILING ===="
	vlib $(LIB)
	vmap work $(LIB)

	vlog -work work -sv $(TB_DIR)/uart_if.sv $(RTL_DIR)/uart.v

	vlog -work work -sv $(INCDIRS) $(UVC_DIR)/env/uart_pkg.sv

	vlog -work work -sv $(TB_DIR)/top.sv

# ================================================================
regress:
	@echo "==== RUNNING REGRESSION ===="
	@mkdir -p logs
	@for t in $(TESTS); do \
		vsim -c top +UVM_TESTNAME=$$t -l logs/$$t.log -do "run -all; quit -f"; \
	done

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
	rm -rf $(LIB) transcript logs *.log modelsim.ini

.PHONY: all compile regress summary clean


