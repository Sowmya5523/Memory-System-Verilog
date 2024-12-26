class ahb_agent extends uvm_agent; 
//factory registeration 
`uvm_component_utils(ahb_agent);

ahb_sqr ahb_sqr_h;
ahb_drv ahb_drv_h;

function new(string name, uvm_component parent); 
	super.new(name,parent); 
endfunction 


//build_phase
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("ahb_agent","build_phase of ahb_agent",UVM_NONE);
	ahb_sqr_h = ahb_sqr::type_id::create("ahb_sqr_h",this);
	ahb_drv_h = ahb_drv::type_id::create("ahb_drv_h",this);
endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);//do or dont do this	
	`uvm_info("ahb_agent","connect_phase of ahb_agent",UVM_NONE);
	ahb_drv_h.seq_item_port.connect(ahb_sqr_h.seq_item_export);//1 to 1 connection
endfunction

endclass
