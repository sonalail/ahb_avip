`ifndef AHB16BITSINGLEREADWITHWAITSTATETEST_INCLUDED_
`define AHB16BITSINGLEREADWITHWAITSTATETEST_INCLUDED_


class Ahb16bitSingleReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitSingleReadWithWaitStateTest)
  
  AhbVirtual16bitSingleReadSequenceWithWaitState ahbVirtual16bitSingleReadSequenceWithWaitState; 

  extern function new(string name = "Ahb16bitSingleReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitSingleReadWithWaitStateTest

function Ahb16bitSingleReadWithWaitStateTest::new(string name = "Ahb16bitSingleReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitSingleReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitSingleReadSequenceWithWaitState = AhbVirtual16bitSingleReadSequenceWithWaitState::type_id::create("ahbVirtual16bitSingleReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitSingleReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitSingleReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

