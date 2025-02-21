`ifndef AHB16BITINCR16READTEST_INCLUDED_
`define AHB16BITINCR16READTEST_INCLUDED_

class Ahb16bitIncr16ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitIncr16ReadTest)
 
  AhbVirtual16bitIncr16ReadSequence ahbVirtual16bitIncr16ReadSequence;
 
  extern function new(string name = "Ahb16bitIncr16ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb16bitIncr16ReadTest
 
function Ahb16bitIncr16ReadTest::new(string name = "Ahb16bitIncr16ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb16bitIncr16ReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual16bitIncr16ReadSequence = AhbVirtual16bitIncr16ReadSequence::type_id::create("ahbVirtual16bitIncr16ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitIncr16ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitIncr16ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase
 
`endif
