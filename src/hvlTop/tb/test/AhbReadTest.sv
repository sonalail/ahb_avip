`ifndef AHBREADTEST_INCLUDED_
`define AHBREADTEST_INCLUDED_

class AhbReadTest extends AhbBaseTest;
  `uvm_component_utils(AhbReadTest)
  
  AhbVirtualReadSequence ahbVirtualReadSequence; 
 
  extern function new(string name = "AhbReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbReadTest

function AhbReadTest::new(string name = "AhbReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbReadTest::run_phase(uvm_phase phase);
  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
    if(!ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==0;}) begin
      `uvm_fatal(get_type_name(),"Unable to randomise noOfWaitStates")
    end
    //ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualReadSequence = AhbVirtualReadSequence::type_id::create("ahbVirtualReadSequence");
 `uvm_info(get_type_name(),$sformatf("AhbReadTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

