`ifndef AHB8BITWRAP8READTEST_INCLUDED_
`define AHB8BITWRAP8READTEST_INCLUDED_

class Ahb8bitWrap8ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitWrap8ReadTest)
  
  AhbVirtual8bitWrap8ReadSequence ahbVirtual8bitWrap8ReadSequence; 

  extern function new(string name = "Ahb8bitWrap8ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitWrap8ReadTest

function Ahb8bitWrap8ReadTest::new(string name = "Ahb8bitWrap8ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitWrap8ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitWrap8ReadSequence = AhbVirtual8bitWrap8ReadSequence::type_id::create("ahbVirtual8bitWrap8ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitWrap8ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitWrap8ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

