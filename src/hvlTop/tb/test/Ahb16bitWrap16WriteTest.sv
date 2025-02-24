`ifndef AHB16BITWRAP16WRITETEST_INCLUDED_
`define AHB16BITWRAP16WRITETEST_INCLUDED_

class Ahb16bitWrap16WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitWrap16WriteTest)
  
  AhbVirtual16bitWrap16WriteSequence ahbVirtual16bitWrap16WriteSequence; 

  extern function new(string name = "Ahb16bitWrap16WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitWrap16WriteTest

function Ahb16bitWrap16WriteTest::new(string name = "Ahb16bitWrap16WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitWrap16WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitWrap16WriteSequence = AhbVirtual16bitWrap16WriteSequence::type_id::create("ahbVirtual16bitWrap16WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitWrap16WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitWrap16WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

