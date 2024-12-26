//define mem_base_test
class mem_base_test extends uvm_test;
`uvm_component_utils(mem_base_test)

mem_env mem_env_h;

function new(string name, uvm_component parent); 
	super.new(name,parent); 
endfunction 

//build_phase - create the tb component
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("MEM_BASE_TEST","build_phase of MEM_BASE_TEST",UVM_NONE);
	//create the mem_env
	mem_env_h = mem_env::type_id::create("mem_env_h",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	`uvm_info("MEM_BASE_TEST",$sformatf("TB structure = %s",this.sprint),UVM_NONE);
endfunction

task run_phase(uvm_phase phase);
	//create the instance for seq
	mem_base_seq seq;
	//allocate memory for the seq
	seq = mem_base_seq::type_id::create("seq");
	`uvm_info("MEM_BASE_TEST","run_phase of MEM_BASE_TEST",UVM_NONE);
	`uvm_info("MEM_BASE_TEST",$sformatf("context = %p",uvm_root::get()),UVM_NONE);
	//raise the objection
	phase.raise_objection(this);
	//start the seq
	seq.start(mem_env_h.mem_agent_h.mem_sqr_h);//functionality of the TB started 
	//set the drain time
	phase.phase_done.set_drain_time(this,100);
	//drop the objection
	phase.drop_objection(this);
endtask

endclass
