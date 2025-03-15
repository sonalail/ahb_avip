
`ifndef AHBSINGLEREADWITHWAITSTATETEST_INCLUDED_
`define AHBSINGLEREADWITHWAITSTATETEST_INCLUDED_

class AhbSingleReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(AhbSingleReadWithWaitStateTest)
  
  AhbVirtualSingleReadWithWaitStateSequence ahbVirtualSingleReadWithWaitStateSequence; 
 
extern function new(string name = "AhbSingleReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbSingleReadWithWaitStateTest

function AhbSingleReadWithWaitStateTest::new(string name = "AhbSingleReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbSingleReadWithWaitStateTest::run_phase(uvm_phase phase);

  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
    if(!ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==2;}) begin
      `uvm_fatal(get_type_name(),"Unable to randomise noOfWaitStates")
    end
    ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualSingleReadWithWaitStateSequence = AhbVirtualSingleReadWithWaitStateSequence::type_id::create("ahbVirtualSingleReadWithWaitStateSequence");
 `uvm_info(get_type_name(),$sformatf("AhbSingleReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualSingleReadWithWaitStateSequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

