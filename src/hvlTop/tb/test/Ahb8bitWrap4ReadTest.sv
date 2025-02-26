
`ifndef AHB8BITWRAP4READTEST_INCLUDED_
`define AHB8BITWRAP4READTEST_INCLUDED_

class Ahb8bitWrap4ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitWrap4ReadTest)
  
  AhbVirtual8bitWrap4ReadSequence ahbVirtual8bitWrap4ReadSequence; 

  extern function new(string name = "Ahb8bitWrap4ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitWrap4ReadTest

function Ahb8bitWrap4ReadTest::new(string name = "Ahb8bitWrap4ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitWrap4ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitWrap4ReadSequence = AhbVirtual8bitWrap4ReadSequence::type_id::create("ahbVirtual8bitWrap4ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitWrap4ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitWrap4ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

