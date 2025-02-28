
`ifndef AHB32BITWRAP8WRITEWITHWAITSTATETEST_INCLUDED_
`define AHB32BITWRAP8WRITEWITHWAITSTATETEST_INCLUDED_


class Ahb32bitWrap8WriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap8WriteWithWaitStateTest)
  
  AhbVirtual32bitWrap8WriteSequenceWithWaitState ahbVirtual32bitWrap8WriteSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitWrap8WriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap8WriteWithWaitStateTest

function Ahb32bitWrap8WriteWithWaitStateTest::new(string name = "Ahb32bitWrap8WriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap8WriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap8WriteSequenceWithWaitState = AhbVirtual32bitWrap8WriteSequenceWithWaitState::type_id::create("ahbVirtual32bitWrap8WriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap8WriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap8WriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
