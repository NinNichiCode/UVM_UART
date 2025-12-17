 
class rand_baud_test extends base_test;
`uvm_component_utils(rand_baud_test)
 
function new(string inst = "rand_baud_test", uvm_component parent = null);
super.new(inst,parent);
endfunction
 
virtual task run_test_seq();
  rand_baud_seq seq;
  seq = rand_baud_seq::type_id::create("seq");
  seq.start(e.a.seqr);

endtask
endclass