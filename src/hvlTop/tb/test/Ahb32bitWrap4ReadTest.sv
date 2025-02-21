`ifndef AHB32BITWRAP4READTEST_INCLUDED_
`define AHB32BITWRAP4READTEST_INCLUDED_

class Ahb32bitWrap4ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap4ReadTest)
  
  AhbVirtual32bitWrap4ReadSequence ahbVirtual32bitWrap4ReadSequence; 

  extern function new(string name = "Ahb32bitWrap4ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap4ReadTest

function Ahb32bitWrap4ReadTest::new(string name = "Ahb32bitWrap4ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap4ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap4ReadSequence = AhbVirtual32bitWrap4ReadSequence::type_id::create("ahbVirtual32bitWrap4ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap4ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap4ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

