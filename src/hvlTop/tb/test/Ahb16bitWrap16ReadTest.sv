`ifndef AHB16BITWRAP16READTEST_INCLUDED_
`define AHB16BITWRAP16READTEST_INCLUDED_

class Ahb16bitWrap16ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitWrap16ReadTest)
  
  AhbVirtual16bitWrap16ReadSequence ahbVirtual16bitWrap16ReadSequence; 

  extern function new(string name = "Ahb16bitWrap16ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitWrap16ReadTest

function Ahb16bitWrap16ReadTest::new(string name = "Ahb16bitWrap16ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitWrap16ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitWrap16ReadSequence = AhbVirtual16bitWrap16ReadSequence::type_id::create("ahbVirtual16bitWrap16ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitWrap16ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitWrap16ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

