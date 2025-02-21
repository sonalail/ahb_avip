`ifndef AHB16BITINCR4READTEST_INCLUDED_
`define AHB16BITINCR4READTEST_INCLUDED_

class Ahb16bitIncr4ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitIncr4ReadTest)
 
  AhbVirtual16bitIncr4ReadSequence ahbVirtual16bitIncr4ReadSequence;
 
  extern function new(string name = "Ahb16bitIncr4ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb16bitIncr4ReadTest
 
function Ahb16bitIncr4ReadTest::new(string name = "Ahb16bitIncr4ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb16bitIncr4ReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual16bitIncr4ReadSequence = AhbVirtual16bitIncr4ReadSequence::type_id::create("ahbVirtual16bitIncr4ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitIncr4ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitIncr4ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase
 
`endif
