`ifndef AHB32BITWRAP16READTEST_INCLUDED_
`define AHB32BITWRAP16READTEST_INCLUDED_

class Ahb32bitWrap16ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap16ReadTest)
  
  AhbVirtual32bitWrap16ReadSequence ahbVirtual32bitWrap16ReadSequence; 

  extern function new(string name = "Ahb32bitWrap16ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap16ReadTest

function Ahb32bitWrap16ReadTest::new(string name = "Ahb32bitWrap16ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap16ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap16ReadSequence = AhbVirtual32bitWrap16ReadSequence::type_id::create("ahbVirtual32bitWrap16ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap16ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap16ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

