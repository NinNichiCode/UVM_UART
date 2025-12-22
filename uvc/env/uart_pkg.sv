package uart_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // ================= SEQ =================
  `include "transaction.sv"
  `include "uart_seq.sv"
  `include "rand_baud_seq.sv"
  `include "rand_baud_with_2_stop_seq.sv"
  `include "rand_baud_len5p_seq.sv"
  `include "rand_baud_len6p_seq.sv"
  `include "rand_baud_len7p_seq.sv"
  `include "rand_baud_len8p_seq.sv"
  `include "seq_lib.sv"

  // ================= ENV =================
  `include "uart_driver.sv"
  `include "uart_monitor.sv"
  `include "uart_agent.sv"
  `include "uart_scoreboard.sv"
  `include "uart_coverage.sv"
  `include "uart_env.sv"

  // ================= TESTS =================
  `include "base_test.sv"
  `include "uart_test.sv"
  `include "rand_baud_test.sv"
  `include "rand_baud_with_2_stop_test.sv"
  `include "rand_baud_len5p_test.sv"
  `include "rand_baud_len6p_test.sv"
  `include "rand_baud_len7p_test.sv"
  `include "rand_baud_len8p_test.sv"
  `include "rand_baud_len5_test.sv"
  `include "rand_baud_len6_test.sv"
  `include "rand_baud_len7_test.sv"
  `include "rand_baud_len8_test.sv"

endpackage : uart_pkg
