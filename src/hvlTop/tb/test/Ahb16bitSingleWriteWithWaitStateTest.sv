`ifndef AHB16BITSINGLEWRITEWITHWAITSTATETEST_INCLUDED_
`define AHB16BITSINGLEWRITEWITHWAITSTATETEST_INCLUDED_


class Ahb16bitSingleWriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitSingleWriteWithWaitStateTest)
  
  AhbVirtual16bitSingleWriteSequenceWithWaitState ahbVirtual16bitSingleWriteSequenceWithWaitState; 

  extern function new(string name = "Ahb16bitSingleWriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitSingleWriteWithWaitStateTest

function Ahb16bitSingleWriteWithWaitStateTest::new(string name = "Ahb16bitSingleWriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitSingleWriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitSingleWriteSequenceWithWaitState = AhbVirtual16bitSingleWriteSequenceWithWaitState::type_id::create("ahbVirtual16bitSingleWriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitSingleWriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitSingleWriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
