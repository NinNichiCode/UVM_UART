class uart_seq extends uvm_sequence#(transaction);
 `uvm_object_utils(uart_seq)
 
 transaction tr;

 function new(string name = "uart_seq");
   super.new(name);
 endfunction
 
 virtual task body();
   repeat(1000)
     begin
       tr = transaction::type_id::create("tr");
       start_item(tr);
       assert(tr.randomize);
       tr.op     = length8wp;
       tr.rst       = 1'b0;
       tr.length = 8;
       tr.tx_data   =  tr.tx_data[7:0];
       tr.tx_start  = 1'b1;
       tr.rx_start  = 1'b1;
       tr.parity_en = 1'b1;
       tr.stop2     = 1'b0;
       finish_item(tr);
     end
 endtask
 

endclass
