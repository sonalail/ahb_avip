`ifndef AHB8BITINCR8READTEST_INCLUDED_
`define AHB8BITINCR8READTEST_INCLUDED_


class Ahb8bitIncr8ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitIncr8ReadTest)
  
  AhbVirtual8bitIncr8ReadSequence ahbVirtual8bitIncr8ReadSequence; 

  extern function new(string name = "Ahb8bitIncr8ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitIncr8ReadTest

function Ahb8bitIncr8ReadTest::new(string name = "Ahb8bitIncr8ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitIncr8ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitIncr8ReadSequence = AhbVirtual8bitIncr8ReadSequence::type_id::create("ahbVirtual8bitIncr8ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitIncr8ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitIncr8ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

