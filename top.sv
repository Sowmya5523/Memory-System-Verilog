`include "uvm_pkg.sv"
import uvm_pkg::*;//* indicated import all the things present inside uvm_pkg

`include "mem_common.sv"
`include "mem_tx.sv"
`include "ahb_tx.sv"
`include "sequence_lib.sv"
`include "mem_drv.sv"
`include "ahb_drv.sv"
`include "mem_sqr.sv"
`include "ahb_sqr.sv"
`include "mem_agent.sv"
`include "ahb_agent.sv"
`include "mem_env.sv"
`include "test_lib.sv"

module top;

initial begin
	//run_test("ahb_base_test");
	//here; run_test will create the ahb_base_test class and build_phase of ahb_base_test gets executed first
	//ahb_base_test is instantiated as uvm_test_top
	run_test("mem_base_test");//uvm_root creates an instance for mem_base_test as uvm_test_top
end

//config_db 
initial begin
	//uvm_config_db#(int)::set(null,"uvm_test_top","count",20);//mem_base_test uvm_test_top;
			//-> only mem_base_test can access the count value
	//uvm_config_db#(int)::set(null,"uvm_test_top.mem_env_h.mem_agent_h","count",20);
	//uvm_config_db#(int)::set(null,"*.mem_agent_h","count",20);
	uvm_config_db#(int)::set(null,"uvm_test_top.*","count",20);
	//who all have access to count?	-> env and below component
	//what type if the value?        -> int based
	`uvm_info("TOP",$sformatf("context = %p",uvm_root::get()),UVM_NONE);

end

endmodule
