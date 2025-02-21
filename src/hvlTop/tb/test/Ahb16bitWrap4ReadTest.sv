`ifndef AHB16BITWRAP4READTEST_INCLUDED_
`define AHB16BITWRAP4READTEST_INCLUDED_

class Ahb16bitWrap4ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitWrap4ReadTest)
  
  AhbVirtual16bitWrap4ReadSequence ahbVirtual16bitWrap4ReadSequence; 

  extern function new(string name = "Ahb16bitWrap4ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitWrap4ReadTest

function Ahb16bitWrap4ReadTest::new(string name = "Ahb16bitWrap4ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitWrap4ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitWrap4ReadSequence = AhbVirtual16bitWrap4ReadSequence::type_id::create("ahbVirtual16bitWrap4ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitWrap4ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitWrap4ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

