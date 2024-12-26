class mem_tx extends uvm_sequence_item;
//factory registeration

//declare the fields 
rand bit [31:0] data;//both wr_rd as well as rd_data
rand bit [15:0] addr;
rand bit wr_rd;

//factory registeration
`uvm_object_utils_begin(mem_tx)// class registeration + field registeration
	`uvm_field_int(data,UVM_ALL_ON)
	`uvm_field_int(addr,UVM_ALL_ON)
	`uvm_field_int(wr_rd,UVM_ALL_ON)
`uvm_object_utils_end

`OBJ_NEW


endclass
