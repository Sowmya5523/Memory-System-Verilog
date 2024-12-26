class mem_env extends uvm_env;//uvm_env -> uvm_component
//factory registeration
`uvm_component_utils(mem_env);
int count_t;

mem_agent mem_agent_h;
ahb_agent ahb_agent_h;

function new(string name, uvm_component parent); 
	super.new(name,parent); 
endfunction 

//build_phase
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("MEM_ENV","build_phase of MEM_ENV",UVM_NONE);
	mem_agent_h = mem_agent::type_id::create("mem_agent_h",this);
	ahb_agent_h = ahb_agent::type_id::create("ahb_agent_h",this);
endfunction

task run_phase(uvm_phase phase);
	if(uvm_config_db#(int)::get(this,"","count",count_t) == 0) begin
		`uvm_error("MEM_ENV","FAILED to get the COUNT value from UVM_CONFIG_DB");
	end
	else begin
		`uvm_info("MEM_ENV",$sformatf("PASS count_t = %0d",count_t),UVM_NONE)
	end
endtask


endclass
