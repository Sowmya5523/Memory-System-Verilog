class mem_drv extends uvm_driver#(mem_tx);
`uvm_component_utils(mem_drv);

//`COMP_NEW
function new(string name, uvm_component parent); 
	super.new(name,parent); 
endfunction 

//do i need build phase - yes but only to call build of uvm_driver 
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("MEM_DRV","build_phase of MEM_DRV",UVM_NONE);
endfunction

task run_phase(uvm_phase phase);
	`uvm_info("MEM_DRV","run_phase of MEM_DRV",UVM_NONE);
	forever begin
		//get the tx 
		seq_item_port.get_next_item(req);
		//drive the tx
		mem_drive_tx(rsp);//user defined task
		//send the resp back
		seq_item_port.item_done();
	end
endtask

task mem_drive_tx(mem_tx tx);
	#10;
	`uvm_info("MEM_DRV","mem_drive_tx os MEM_DRV",UVM_NONE);
endtask

endclass
