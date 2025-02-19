`ifndef AHB8BITSINGLEREADTEST_INCLUDED_
`define AHB8BITSINGLEREADTEST_INCLUDED_

class Ahb8bitSingleReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitSingleReadTest)
 
  AhbVirtual8bitSingleReadSequence ahbVirtual8bitSingleReadSequence;
 
  extern function new(string name = "Ahb8bitSingleReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb8bitSingleReadTest
 
function Ahb8bitSingleReadTest::new(string name = "Ahb8bitSingleReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb8bitSingleReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual8bitSingleReadSequence = AhbVirtual8bitSingleReadSequence::type_id::create("ahbVirtual8bitSingleReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitSingleReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitSingleReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase
 
`endif
