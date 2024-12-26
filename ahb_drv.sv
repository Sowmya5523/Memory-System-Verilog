class ahb_drv extends uvm_driver#(ahb_tx);
//declare a count_t;
int count_t;//is not registered into factory
int count;//config_db count // is registerd to factory

//`uvm_component_utils(ahb_drv)

//register the config_db count to the factory
`uvm_component_utils_begin(ahb_drv)
	`uvm_field_int(count,UVM_ALL_ON)
`uvm_component_utils_end

//`COMP_NEW
function new(string name, uvm_component parent); 
	super.new(name,parent); 
endfunction 

//do i need build phase - yes but only to call build of uvm_driver 
function void build_phase(uvm_phase phase);
	//retrival component should have call super.build_phase(phase) call
	super.build_phase(phase);//needed in uvm-1.1d but in uvm-1.2 this step is not needed
	`uvm_info("ahb_drv","build_phase of ahb_drv",UVM_NONE);
endfunction

task run_phase(uvm_phase phase);
	`uvm_info("ahb_drv","run_phase of ahb_drv",UVM_NONE);
	//if i want to get/retrive the value from config_db
	//for auto-retrival of interger/string based values user dont need to call get method
	//uvm_component#(int)::get(this,"","count",count_t);//manual retrival
	`uvm_info(get_full_name(),$sformatf("auto-retrival of count = %0d",count),UVM_NONE);
	forever begin
		//get the tx 
		seq_item_port.get_next_item(req);
		//drive the tx
		mem_drive_tx(rsp);//user defined task
		//send the resp back
		seq_item_port.item_done();
	end
endtask

task mem_drive_tx(ahb_tx tx);
	#10;
	`uvm_info("ahb_drv","mem_drive_tx os ahb_drv",UVM_NONE);
endtask

endclass
