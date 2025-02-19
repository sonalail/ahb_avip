`ifndef AHB8BITSINGLEWRITEWITHWAITSTATETEST_INCLUDED_
`define AHB8BITSINGLEWRITEWITHWAITSTATETEST_INCLUDED_


class Ahb8bitSingleWriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitSingleWriteWithWaitStateTest)
  
  AhbVirtual8bitSingleWriteSequenceWithWaitState ahbVirtual8bitSingleWriteSequenceWithWaitState; 

  extern function new(string name = "Ahb8bitSingleWriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitSingleWriteWithWaitStateTest

function Ahb8bitSingleWriteWithWaitStateTest::new(string name = "Ahb8bitSingleWriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitSingleWriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitSingleWriteSequenceWithWaitState = AhbVirtual8bitSingleWriteSequenceWithWaitState::type_id::create("ahbVirtual8bitSingleWriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitSingleWriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitSingleWriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
