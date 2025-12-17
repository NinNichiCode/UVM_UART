 
class base_test extends uvm_test;
`uvm_component_utils(base_test)
 
function new(string inst = "base_test", uvm_component parent = null);
   super.new(inst,parent);
endfunction
 
uart_env e;
  
virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   e       = uart_env::type_id::create("env",this);
endfunction
 
virtual task run_phase(uvm_phase phase);
   phase.raise_objection(this);
      run_test_seq();
   phase.drop_objection(this);
endtask

virtual task run_test_seq();
   
endtask

function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
endfunction

function void report_phase(uvm_phase phase);
   int error_cnt; 
   uvm_report_server server;
   server = uvm_report_server::get_server();
   
   error_cnt = server.get_severity_count(UVM_FATAL) +
               server.get_severity_count(UVM_ERROR);

    `uvm_info("TEST","=============================", UVM_NONE);
    if (error_cnt == 0) begin
        `uvm_info("TEST","TEST PASSED", UVM_NONE);
    end else begin
        `uvm_info("TEST",$sformatf("TEST FAILED with %0d errors", error_cnt), UVM_NONE);
    end
endfunction

endclass