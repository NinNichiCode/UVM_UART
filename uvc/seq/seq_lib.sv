//////////////////////////////////////////////////////////
////////////////////fixed length = 5 - variable baud - without parity
class rand_baud_len5_seq extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len5_seq)
  
  transaction tr;
 
  function new(string name = "rand_baud_len5_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length5wop;
        tr.rst       = 1'b0;
        tr.length = 5;
        tr.tx_data   = {3'b000, tr.tx_data[7:3]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  
 
endclass
 
 
//////////////////////////////////////////////////////////
////////////////////fixed length = 6- variable baud - without parity
class rand_baud_len6_seq extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len6_seq)
  
  transaction tr;
 
  function new(string name = "rand_baud_len6_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length6wop;
        tr.rst       = 1'b0;
        tr.length = 6;
        tr.tx_data   = {2'b00, tr.tx_data[7:2]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  
 
endclass
 
//////////////////////////////////////////////////////////
////////////////////fixed length = 7- variable baud - without parity
class rand_baud_len7_seq extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len7_seq)
  
  transaction tr;
 
  function new(string name = "rand_baud_len7_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length7wop;
        tr.rst       = 1'b0;
        tr.length = 7;
        tr.tx_data   = {1'b0, tr.tx_data[7:1]};
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  
 
endclass
 
 
//////////////////////////////////////////////////////////
////////////////////fixed length = 8 - variable baud - without parity
class rand_baud_len8_seq extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_baud_len8_seq)
  
  transaction tr;
 
  function new(string name = "rand_baud_len8_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize);
        tr.op     = length8wop;
        tr.rst       = 1'b0;
        tr.length = 8;
        tr.tx_data   =  tr.tx_data[7:0];
        tr.tx_start  = 1'b1;
        tr.rx_start  = 1'b1;
        tr.parity_en = 1'b0;
        tr.stop2     = 1'b0;
        finish_item(tr);
      end
  endtask
  
 
endclass