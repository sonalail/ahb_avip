`ifndef AHB16BITWRAP8READTEST_INCLUDED_
`define AHB16BITWRAP8READTEST_INCLUDED_

class Ahb16bitWrap8ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitWrap8ReadTest)
  
  AhbVirtual16bitWrap8ReadSequence ahbVirtual16bitWrap8ReadSequence; 

  extern function new(string name = "Ahb16bitWrap8ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitWrap8ReadTest

function Ahb16bitWrap8ReadTest::new(string name = "Ahb16bitWrap8ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitWrap8ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitWrap8ReadSequence = AhbVirtual16bitWrap8ReadSequence::type_id::create("ahbVirtual16bitWrap8ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitWrap8ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitWrap8ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

