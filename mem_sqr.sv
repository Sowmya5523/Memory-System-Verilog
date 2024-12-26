class mem_sqr extends uvm_sequencer#(mem_tx);
`uvm_component_utils(mem_sqr);

//`COMP_NEW
function new(string name, uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("MEM_SQR","build_phase of MEM_SQR",UVM_NONE);
endfunction

endclass

