`ifndef AHBREADWITHBUSYTEST_INCLUDED_
`define AHBREADWITHBUSYTEST_INCLUDED_

class AhbReadWithBusyTest extends AhbBaseTest;
  `uvm_component_utils(AhbReadWithBusyTest)
  
  AhbVirtualReadWithBusySequence ahbVirtualReadWithBusySequence; 
 
extern function new(string name = "AhbReadWithBusyTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbReadWithBusyTest

function AhbReadWithBusyTest::new(string name = "AhbReadWithBusyTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbReadWithBusyTest::run_phase(uvm_phase phase);
  
  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
    if(!ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==0;}) begin
      `uvm_fatal(get_type_name(),"Unable to randomise noOfWaitStates")
    end
    ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualReadWithBusySequence = AhbVirtualReadWithBusySequence::type_id::create("ahbVirtualReadWithBusySequence");
 `uvm_info(get_type_name(),$sformatf("AhbReadWithBusyTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualReadWithBusySequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

