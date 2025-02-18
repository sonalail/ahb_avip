`ifndef AHB32BITSINGLEWRITEWITHWAITSTATETEST_INCLUDED_
`define AHB32BITSINGLEWRITEWITHWAITSTATETEST_INCLUDED_


class Ahb32bitSingleWriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitSingleWriteWithWaitStateTest)
  
  AhbVirtual32bitSingleWriteSequenceWithWaitState ahbVirtual32bitSingleWriteSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitSingleWriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitSingleWriteWithWaitStateTest

function Ahb32bitSingleWriteWithWaitStateTest::new(string name = "Ahb32bitSingleWriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitSingleWriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitSingleWriteSequenceWithWaitState = AhbVirtual32bitSingleWriteSequenceWithWaitState::type_id::create("ahbVirtual32bitSingleWriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitSingleWriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitSingleWriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
