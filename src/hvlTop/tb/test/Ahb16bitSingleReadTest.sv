`ifndef AHB16BITSINGLEREADTEST_INCLUDED_
`define AHB16BITSINGLEREADTEST_INCLUDED_

class Ahb16bitSingleReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitSingleReadTest)
 
  AhbVirtual16bitSingleReadSequence ahbVirtual16bitSingleReadSequence;
 
  extern function new(string name = "Ahb16bitSingleReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb16bitSingleReadTest
 
function Ahb16bitSingleReadTest::new(string name = "Ahb16bitSingleReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb16bitSingleReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual16bitSingleReadSequence = AhbVirtual16bitSingleReadSequence::type_id::create("ahbVirtual16bitSingleReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitSingleReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitSingleReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase

`endif
