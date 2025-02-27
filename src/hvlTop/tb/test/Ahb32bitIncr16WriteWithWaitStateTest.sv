`ifndef AHB32BITINCR16WRITEWITHWAITSTATETEST_INCLUDED_
`define AHB32BITINCR16WRITEWITHWAITSTATETEST_INCLUDED_


class Ahb32bitIncr16WriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr16WriteWithWaitStateTest)
  
  AhbVirtual32bitIncr16WriteSequenceWithWaitState ahbVirtual32bitIncr16WriteSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitIncr16WriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr16WriteWithWaitStateTest

function Ahb32bitIncr16WriteWithWaitStateTest::new(string name = "Ahb32bitIncr16WriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr16WriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr16WriteSequenceWithWaitState = AhbVirtual32bitIncr16WriteSequenceWithWaitState::type_id::create("ahbVirtual32bitIncr16WriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr16WriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr16WriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
