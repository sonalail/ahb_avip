`ifndef AHB32BITWRAP4WRITETEST_INCLUDED_
`define AHB32BITWRAP4WRITETEST_INCLUDED_

class Ahb32bitWrap4WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap4WriteTest)
  
  AhbVirtual32bitWrap4WriteSequence ahbVirtual32bitWrap4WriteSequence; 

  extern function new(string name = "Ahb32bitWrap4WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap4WriteTest

function Ahb32bitWrap4WriteTest::new(string name = "Ahb32bitWrap4WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap4WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap4WriteSequence = AhbVirtual32bitWrap4WriteSequence::type_id::create("ahbVirtual32bitWrap4WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap4WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap4WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

