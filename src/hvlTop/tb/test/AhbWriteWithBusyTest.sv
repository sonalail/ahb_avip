`ifndef AHBWRITEWITHBUSYTEST_INCLUDED_
`define AHBWRITEWITHBUSYTEST_INCLUDED_

class AhbWriteWithBusyTest extends AhbBaseTest;
  `uvm_component_utils(AhbWriteWithBusyTest)
  
  AhbVirtualWriteWithBusySequence ahbVirtualWriteWithBusySequence; 
 
  extern function new(string name = "AhbWriteWithBusyTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbWriteWithBusyTest

function AhbWriteWithBusyTest::new(string name = "AhbWriteWithBusyTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbWriteWithBusyTest::run_phase(uvm_phase phase);
  
  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
    if(!ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==0;}) begin
      `uvm_fatal(get_type_name(),"Unable to randomise noOfWaitStates")
    end
    //ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualWriteWithBusySequence = AhbVirtualWriteWithBusySequence::type_id::create("ahbVirtualWriteWithBusySequence");
  `uvm_info(get_type_name(),$sformatf("AhbWriteWithBusyTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualWriteWithBusySequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

