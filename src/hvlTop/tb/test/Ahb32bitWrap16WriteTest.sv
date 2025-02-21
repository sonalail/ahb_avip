`ifndef AHB32BITWRAP16WRITETEST_INCLUDED_
`define AHB32BITWRAP16WRITETEST_INCLUDED_

class Ahb32bitWrap16WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap16WriteTest)
  
  AhbVirtual32bitWrap16WriteSequence ahbVirtual32bitWrap16WriteSequence; 

  extern function new(string name = "Ahb32bitWrap16WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap16WriteTest

function Ahb32bitWrap16WriteTest::new(string name = "Ahb32bitWrap16WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap16WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap16WriteSequence = AhbVirtual32bitWrap16WriteSequence::type_id::create("ahbVirtual32bitWrap16WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap16WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap16WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

