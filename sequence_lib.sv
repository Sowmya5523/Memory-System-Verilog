//sequence is needed in  a TB to generate different types of tx
class mem_base_seq extends uvm_sequence#(mem_tx);
`uvm_object_utils(mem_base_seq);

`OBJ_NEW

task pre_body();
	`uvm_info("MEM_BASE_SEQ","pre_body of MEM_BASE_SEQ",UVM_NONE);
endtask

task body();
	`uvm_info("MEM_BASE_SEQ","body of MEM_BASE_SEQ",UVM_NONE);
endtask

task post_body();
	`uvm_info("MEM_BASE_SEQ","post_phase of MEM_BASE_SEQ",UVM_NONE);
endtask
endclass
