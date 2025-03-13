`ifndef AHBWRITEWITHWAITSTATETEST_INCLUDED_
`define AHBWRITEWITHWAITSTATETEST_INCLUDED_

class AhbWriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(AhbWriteWithWaitStateTest)
  
  AhbVirtualWriteWithWaitStateSequence ahbVirtualWriteWithWaitStateSequence; 
 
extern function new(string name = "AhbWriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbWriteWithWaitStateTest

function AhbWriteWithWaitStateTest::new(string name = "AhbWriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbWriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
    ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==2;};
    ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualWriteWithWaitStateSequence = AhbVirtualWriteWithWaitStateSequence::type_id::create("ahbVirtualWriteWithWaitStateSequence");
  `uvm_info(get_type_name(),$sformatf("AhbWriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtualWriteWithWaitStateSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

