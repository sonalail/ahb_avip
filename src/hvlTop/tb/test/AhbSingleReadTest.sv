`ifndef AHBSINGLEREADTEST_INCLUDED_
`define AHBSINGLEREADTEST_INCLUDED_

class AhbSingleReadTest extends AhbBaseTest;
  `uvm_component_utils(AhbSingleReadTest)
  
  AhbVirtualSingleReadSequence ahbVirtualSingleReadSequence; 
 
  extern function new(string name = "AhbSingleReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbSingleReadTest

function AhbSingleReadTest::new(string name = "AhbSingleReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbSingleReadTest::run_phase(uvm_phase phase);
  
  foreach(ahbEnvironment.ahbSlaveAgentConfig[i]) begin
    if(!ahbEnvironment.ahbSlaveAgentConfig[i].randomize() with {noOfWaitStates==0;}) begin
      `uvm_fatal(get_type_name(),"Unable to randomise noOfWaitStates")
    end
   // ahbEnvironment.ahbMasterAgentConfig[i].noOfWaitStates = ahbEnvironment.ahbSlaveAgentConfig[i].noOfWaitStates ;
  end
  ahbVirtualSingleReadSequence = AhbVirtualSingleReadSequence::type_id::create("ahbVirtualSingleReadSequence");
 `uvm_info(get_type_name(),$sformatf("AhbSingleReadTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualSingleReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

