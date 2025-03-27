`ifndef AHBREADWITHWAITSTATETEST_INCLUDED_
`define AHBREADWITHWAITSTATETEST_INCLUDED_

class AhbReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(AhbReadWithWaitStateTest)
  
  AhbVirtualReadWithWaitStateSequence ahbVirtualReadWithWaitStateSequence; 
 
  extern function new(string name = "AhbReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbReadWithWaitStateTest

function AhbReadWithWaitStateTest::new(string name = "AhbReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
      if(!ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==2;}) begin
        `uvm_fatal(get_type_name(),"Unable to randomise noOfWaitStates")
      end
    //ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualReadWithWaitStateSequence = AhbVirtualReadWithWaitStateSequence::type_id::create("ahbVirtualReadWithWaitStateSequence");
  `uvm_info(get_type_name(),$sformatf("AhbReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualReadWithWaitStateSequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

