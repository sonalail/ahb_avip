`ifndef AHB16BITINCR8READTEST_INCLUDED_
`define AHB16BITINCR8READTEST_INCLUDED_

class Ahb16bitIncr8ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitIncr8ReadTest)
 
  AhbVirtual16bitIncr8ReadSequence ahbVirtual16bitIncr8ReadSequence;
 
  extern function new(string name = "Ahb16bitIncr8ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb16bitIncr8ReadTest
 
function Ahb16bitIncr8ReadTest::new(string name = "Ahb16bitIncr8ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb16bitIncr8ReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual16bitIncr8ReadSequence = AhbVirtual16bitIncr8ReadSequence::type_id::create("ahbVirtual16bitIncr8ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitIncr8ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitIncr8ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase
 
`endif
