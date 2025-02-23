`ifndef AHB16BITWRAP8WRITETEST_INCLUDED_
`define AHB16BITWRAP8WRITETEST_INCLUDED_

class Ahb16bitWrap8WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitWrap8WriteTest)
  
  AhbVirtual16bitWrap8WriteSequence ahbVirtual16bitWrap8WriteSequence; 

  extern function new(string name = "Ahb16bitWrap8WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitWrap8WriteTest

function Ahb16bitWrap8WriteTest::new(string name = "Ahb16bitWrap8WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitWrap8WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitWrap8WriteSequence = AhbVirtual16bitWrap8WriteSequence::type_id::create("ahbVirtual16bitWrap8WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitWrap8WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitWrap8WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

