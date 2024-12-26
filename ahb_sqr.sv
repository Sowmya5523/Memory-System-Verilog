class ahb_sqr extends uvm_sequencer#(ahb_tx);
`uvm_component_utils(ahb_sqr);

//`COMP_NEW
function new(string name, uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("ahb_sqr","build_phase of ahb_sqr",UVM_NONE);
endfunction

endclass

