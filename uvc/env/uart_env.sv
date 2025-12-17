
class uart_env extends uvm_env;
`uvm_component_utils(uart_env)
 
function new(input string inst = "uart_env", uvm_component c);
super.new(inst,c);
endfunction
 
uart_agent a;
uart_scoreboard s;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  a = uart_agent::type_id::create("a",this);
  s = uart_scoreboard::type_id::create("s", this);
endfunction
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
 a.m.send.connect(s.recv);
endfunction
 
endclass