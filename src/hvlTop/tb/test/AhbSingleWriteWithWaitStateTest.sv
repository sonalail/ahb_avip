
`ifndef AHBSINGLEWRITEWITHWAITSTATETEST_INCLUDED_
`define AHBSINGLEWRITEWITHWAITSTATETEST_INCLUDED_

class AhbSingleWriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(AhbSingleWriteWithWaitStateTest)
  
  AhbVirtualSingleWriteWithWaitStateSequence ahbVirtualSingleWriteWithWaitStateSequence; 
 
extern function new(string name = "AhbSingleWriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbSingleWriteWithWaitStateTest

function AhbSingleWriteWithWaitStateTest::new(string name = "AhbSingleWriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbSingleWriteWithWaitStateTest::run_phase(uvm_phase phase);

  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
    ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==2;};
    ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualSingleWriteWithWaitStateSequence = AhbVirtualSingleWriteWithWaitStateSequence::type_id::create("ahbVirtualSingleWriteWithWaitStateSequence");
 `uvm_info(get_type_name(),$sformatf("AhbSingleWriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualSingleWriteWithWaitStateSequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

