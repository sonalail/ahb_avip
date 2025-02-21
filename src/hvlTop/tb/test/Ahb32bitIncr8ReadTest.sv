`ifndef AHB32BITINCR8READTEST_INCLUDED_
`define AHB32BITINCR8READTEST_INCLUDED_

class Ahb32bitIncr8ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr8ReadTest)
 
  AhbVirtual32bitIncr8ReadSequence ahbVirtual32bitIncr8ReadSequence;
 
  extern function new(string name = "Ahb32bitIncr8ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb32bitIncr8ReadTest
 
function Ahb32bitIncr8ReadTest::new(string name = "Ahb32bitIncr8ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb32bitIncr8ReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual32bitIncr8ReadSequence = AhbVirtual32bitIncr8ReadSequence::type_id::create("ahbVirtual32bitIncr8ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr8ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr8ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase
 
`endif
