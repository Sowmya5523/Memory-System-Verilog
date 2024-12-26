class mem_agent extends uvm_agent; 
//factory registeration 
`uvm_component_utils(mem_agent);
int count_t;

mem_sqr mem_sqr_h;
mem_drv mem_drv_h;

function new(string name, uvm_component parent); 
	super.new(name,parent); 
endfunction 


//build_phase
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("MEM_AGENT","build_phase of MEM_AGENT",UVM_NONE);
	mem_sqr_h = mem_sqr::type_id::create("mem_sqr_h",this);
	mem_drv_h = mem_drv::type_id::create("mem_drv_h",this);
endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);//do or dont do this	
	`uvm_info("MEM_AGENT","connect_phase of MEM_AGENT",UVM_NONE);
	mem_drv_h.seq_item_port.connect(mem_sqr_h.seq_item_export);//1 to 1 connection
endfunction

task run_phase(uvm_phase phase);
	if(uvm_config_db#(int)::get(this,"","count",count_t) == 0) begin
		`uvm_error("MEM_AGENT","FAILED to get the COUNT value from UVM_CONFIG_DB");
	end
	else begin
		`uvm_info("MEM_AGENT",$sformatf("PASS count_t = %0d",count_t),UVM_NONE)
	end
endtask

endclass
