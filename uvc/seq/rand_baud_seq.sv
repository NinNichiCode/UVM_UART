///////////////////random baud - fixed length = 8 - parity enable - parity type : random - single stop
class rand_baud_seq extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_seq)
  
  transaction tr;
 
  function new(string name = "rand_baud_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = rand_baud_1_stop;
        tr.length = 8;
        tr.baud   = 9600;
        tr.rst       = 1'b0;
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b1;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  
 
endclass