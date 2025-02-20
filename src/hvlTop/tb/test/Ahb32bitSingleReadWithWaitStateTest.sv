
`ifndef AHB32BITSINGLEREADWITHWAITSTATETEST_INCLUDED_
`define AHB32BITSINGLEREADWITHWAITSTATETEST_INCLUDED_


class Ahb32bitSingleReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitSingleReadWithWaitStateTest)
  
  AhbVirtual32bitSingleReadSequenceWithWaitState ahbVirtual32bitSingleReadSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitSingleReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitSingleReadWithWaitStateTest

function Ahb32bitSingleReadWithWaitStateTest::new(string name = "Ahb32bitSingleReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitSingleReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitSingleReadSequenceWithWaitState = AhbVirtual32bitSingleReadSequenceWithWaitState::type_id::create("ahbVirtual32bitSingleReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitSingleReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitSingleReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
