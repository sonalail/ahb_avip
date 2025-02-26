`ifndef AHB8BITWRAP16WRITETEST_INCLUDED_
`define AHB8BITWRAP16WRITETEST_INCLUDED_

class Ahb8bitWrap16WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitWrap16WriteTest)
  
  AhbVirtual8bitWrap16WriteSequence ahbVirtual8bitWrap16WriteSequence; 

  extern function new(string name = "Ahb8bitWrap16WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitWrap16WriteTest

function Ahb8bitWrap16WriteTest::new(string name = "Ahb8bitWrap16WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitWrap16WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitWrap16WriteSequence = AhbVirtual8bitWrap16WriteSequence::type_id::create("ahbVirtual8bitWrap16WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitWrap16WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitWrap16WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

