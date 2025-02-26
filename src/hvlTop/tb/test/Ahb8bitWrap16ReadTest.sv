`ifndef AHB8BITWRAP16READTEST_INCLUDED_
`define AHB8BITWRAP16READTEST_INCLUDED_

class Ahb8bitWrap16ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitWrap16ReadTest)
  
  AhbVirtual8bitWrap16ReadSequence ahbVirtual8bitWrap16ReadSequence; 

  extern function new(string name = "Ahb8bitWrap16ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitWrap16ReadTest

function Ahb8bitWrap16ReadTest::new(string name = "Ahb8bitWrap16ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitWrap16ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitWrap16ReadSequence = AhbVirtual8bitWrap16ReadSequence::type_id::create("ahbVirtual8bitWrap16ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitWrap16ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitWrap16ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

