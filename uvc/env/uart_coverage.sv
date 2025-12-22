class uart_coverage extends uvm_subscriber #(transaction);
    `uvm_component_utils(uart_coverage)

    transaction trans;

    covergroup cov_inst;
	CP_TX_DATA: coverpoint trans.tx_data{
		bins tx_data_ranges[8] = {[8'h00:8'hff]};
		bins tx_data_corner[] = {8'h00, 8'hff, 8'haa, 8'h55};
	}

	CP_LENGTH: coverpoint trans.length{
		bins length_ranges[] = {4'h5, 4'h6, 4'h7, 4'h8};
	}

	CP_BAUD: coverpoint trans.baud {
		bins baud_ranges[] = {4800, 9600, 14400, 19200, 38400, 57600, 115200, 128000};
	}

	
	CP_PARITY_EN: coverpoint trans.parity_en {
	        bins parity_en_0 = {0};
		bins parity_en_1 = {1};
	}

	CP_PARITY_TYPE: coverpoint trans.parity_type {
		bins parity_type_0 = {0};
		bins parity_type_1 = {1};
	}

	CP_STOP2: coverpoint trans.stop2 {
		bins stop_0 = {0};
		bins stop_1 = {1};
	}


    endgroup

    function new (string name = "uart_coverage", uvm_component parent = null);
       super.new(name, parent);
       cov_inst = new();
    endfunction

    virtual function void write(transaction t);
       trans = t;
       cov_inst.sample();
    endfunction
endclass

