`ifndef AHB8BITSINGLEREADWITHWAITSTATETEST_INCLUDED_
`define AHB8BITSINGLEREADWITHWAITSTATETEST_INCLUDED_


class Ahb8bitSingleReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitSingleReadWithWaitStateTest)
  
  AhbVirtual8bitSingleReadSequenceWithWaitState ahbVirtual8bitSingleReadSequenceWithWaitState; 

  extern function new(string name = "Ahb8bitSingleReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitSingleReadWithWaitStateTest

function Ahb8bitSingleReadWithWaitStateTest::new(string name = "Ahb8bitSingleReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitSingleReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitSingleReadSequenceWithWaitState = AhbVirtual8bitSingleReadSequenceWithWaitState::type_id::create("ahbVirtual8bitSingleReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitSingleReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitSingleReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
