`ifndef AHBWRITETEST_INCLUDED_
`define AHBWRITETEST_INCLUDED_

class AhbWriteTest extends AhbBaseTest;
  `uvm_component_utils(AhbWriteTest)
  
  AhbVirtualWriteSequence ahbVirtualWriteSequence; 
 
extern function new(string name = "AhbWriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : AhbWriteTest

function AhbWriteTest::new(string name = "AhbWriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task AhbWriteTest::run_phase(uvm_phase phase);
  
  ahbVirtualWriteSequence = AhbVirtualWriteSequence::type_id::create("ahbVirtualWriteSequence");
  `uvm_info(get_type_name(),$sformatf("AhbWriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtualWriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

