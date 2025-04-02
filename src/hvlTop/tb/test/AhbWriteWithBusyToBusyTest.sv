`ifndef AHBWRITEWITHBUSYTOBUSYTEST_INCLUDED_
`define AHBWRITEWITHBUSYTOBUSYTEST_INCLUDED_

class AhbWriteWithBusyToBusyTest extends AhbBaseTest;
  `uvm_component_utils(AhbWriteWithBusyToBusyTest)
  
  AhbVirtualWriteWithBusyToBusySequence ahbVirtualWriteWithBusyToBusySequence; 
 
  extern function new(string name = "AhbWriteWithBusyToBusyTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbWriteWithBusyToBusyTest

function AhbWriteWithBusyToBusyTest::new(string name = "AhbWriteWithBusyToBusyTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbWriteWithBusyToBusyTest::run_phase(uvm_phase phase);
  
  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
    if(!ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==0;}) begin
      `uvm_fatal(get_type_name(),"Unable to randomise noOfWaitStates")
    end
    //ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualWriteWithBusyToBusySequence = AhbVirtualWriteWithBusyToBusySequence::type_id::create("ahbVirtualWriteWithBusyToBusySequence");
  `uvm_info(get_type_name(),$sformatf("AhbWriteWithBusyToBusyTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualWriteWithBusyToBusySequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

