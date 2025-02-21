`ifndef AHB32BITINCR16READTEST_INCLUDED_
`define AHB32BITINCR16READTEST_INCLUDED_

class Ahb32bitIncr16ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr16ReadTest)
 
  AhbVirtual32bitIncr16ReadSequence ahbVirtual32bitIncr16ReadSequence;
 
  extern function new(string name = "Ahb32bitIncr16ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
 
endclass : Ahb32bitIncr16ReadTest
 
function Ahb32bitIncr16ReadTest::new(string name = "Ahb32bitIncr16ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new
 
 
task Ahb32bitIncr16ReadTest::run_phase(uvm_phase phase);
 
  ahbVirtual32bitIncr16ReadSequence = AhbVirtual32bitIncr16ReadSequence::type_id::create("ahbVirtual32bitIncr16ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr16ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr16ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
        #10;
  phase.drop_objection(this);
 
endtask : run_phase
 
`endif
