`ifndef AHB32BITINCR4READTEST_INCLUDED_
`define AHB32BITINCR4READTEST_INCLUDED_

class Ahb32bitIncr4ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr4ReadTest)
 
  AhbVirtual32bitIncr4ReadSequence ahbVirtual32bitIncr4ReadSequence;
 
  extern function new(string name = "Ahb32bitIncr4ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb32bitIncr4ReadTest
 
function Ahb32bitIncr4ReadTest::new(string name = "Ahb32bitIncr4ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb32bitIncr4ReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual32bitIncr4ReadSequence = AhbVirtual32bitIncr4ReadSequence::type_id::create("ahbVirtual32bitIncr4ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr4ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr4ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase
 
`endif
