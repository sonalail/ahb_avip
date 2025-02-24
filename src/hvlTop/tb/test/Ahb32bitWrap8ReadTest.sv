`ifndef AHB32BITWRAP8READTEST_INCLUDED_
`define AHB32BITWRAP8READTEST_INCLUDED_

class Ahb32bitWrap8ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap8ReadTest)
  
  AhbVirtual32bitWrap8ReadSequence ahbVirtual32bitWrap8ReadSequence; 

  extern function new(string name = "Ahb32bitWrap8ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap8ReadTest

function Ahb32bitWrap8ReadTest::new(string name = "Ahb32bitWrap8ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap8ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap8ReadSequence = AhbVirtual32bitWrap8ReadSequence::type_id::create("ahbVirtual32bitWrap8ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap8ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap8ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

