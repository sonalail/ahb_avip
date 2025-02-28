
`ifndef AHB32BITWRAP4WRITEWITHWAITSTATETEST_INCLUDED_
`define AHB32BITWRAP4WRITEWITHWAITSTATETEST_INCLUDED_


class Ahb32bitWrap4WriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap4WriteWithWaitStateTest)
  
  AhbVirtual32bitWrap4WriteSequenceWithWaitState ahbVirtual32bitWrap4WriteSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitWrap4WriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap4WriteWithWaitStateTest

function Ahb32bitWrap4WriteWithWaitStateTest::new(string name = "Ahb32bitWrap4WriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap4WriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap4WriteSequenceWithWaitState = AhbVirtual32bitWrap4WriteSequenceWithWaitState::type_id::create("ahbVirtual32bitWrap4WriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap4WriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap4WriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
