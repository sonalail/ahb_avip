`ifndef AHB8BITWRAP8WRITETEST_INCLUDED_
`define AHB8BITWRAP8WRITETEST_INCLUDED_

class Ahb8bitWrap8WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitWrap8WriteTest)
  
  AhbVirtual8bitWrap8WriteSequence ahbVirtual8bitWrap8WriteSequence; 

  extern function new(string name = "Ahb8bitWrap8WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitWrap8WriteTest

function Ahb8bitWrap8WriteTest::new(string name = "Ahb8bitWrap8WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitWrap8WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitWrap8WriteSequence = AhbVirtual8bitWrap8WriteSequence::type_id::create("ahbVirtual8bitWrap8WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitWrap8WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitWrap8WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

