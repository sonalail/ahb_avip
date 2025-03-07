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
  
  ahbVirtualReadWithBusySequence = AhbVirtualReadWithBusySequence::type_id::create("ahbVirtualReadWithBusySequence");
 `uvm_info(get_type_name(),$sformatf("AhbReadWithBusyTest"),UVM_LOW);
  phase.raise_objection(this);
  ahbVirtualReadWithBusySequence.start(ahbEnvironment.ahbVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

