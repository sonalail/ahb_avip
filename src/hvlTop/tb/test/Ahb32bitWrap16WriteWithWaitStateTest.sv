

`ifndef AHB32BITWRAP16WRITEWITHWAITSTATETEST_INCLUDED_
`define AHB32BITWRAP16WRITEWITHWAITSTATETEST_INCLUDED_


class Ahb32bitWrap16WriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap16WriteWithWaitStateTest)
  
  AhbVirtual32bitWrap16WriteSequenceWithWaitState ahbVirtual32bitWrap16WriteSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitWrap16WriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap16WriteWithWaitStateTest

function Ahb32bitWrap16WriteWithWaitStateTest::new(string name = "Ahb32bitWrap16WriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap16WriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap16WriteSequenceWithWaitState = AhbVirtual32bitWrap16WriteSequenceWithWaitState::type_id::create("ahbVirtual32bitWrap16WriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap16WriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap16WriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
