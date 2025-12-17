 
class uart_test extends base_test;
`uvm_component_utils(uart_test)
 
function new(string inst = "uart_test", uvm_component parent = null);
super.new(inst,parent);
endfunction
 
virtual task run_test_seq();
  uart_seq seq;
  seq = uart_seq::type_id::create("seq");
  seq.start(e.a.seqr);

endtask
endclass