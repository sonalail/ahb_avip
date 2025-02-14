`ifndef AHB32BITSINGLEREADTEST_INCLUDED_
`define AHB32BITSINGLEREADTEST_INCLUDED_

class Ahb32bitSingleReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitSingleReadTest)
 
  AhbVirtual32bitSingleReadSequence ahbVirtual32bitSingleReadSequence;
 
  extern function new(string name = "Ahb32bitSingleReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb32bitSingleReadTest
 
function Ahb32bitSingleReadTest::new(string name = "Ahb32bitSingleReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb32bitSingleReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual32bitSingleReadSequence = AhbVirtual32bitSingleReadSequence::type_id::create("ahbVirtual32bitSingleReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitSingleReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitSingleReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase
 
`endif
