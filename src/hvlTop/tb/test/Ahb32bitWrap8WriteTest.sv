`ifndef AHB32BITWRAP8WRITETEST_INCLUDED_
`define AHB32BITWRAP8WRITETEST_INCLUDED_

class Ahb32bitWrap8WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap8WriteTest)
  
  AhbVirtual32bitWrap8WriteSequence ahbVirtual32bitWrap8WriteSequence; 

  extern function new(string name = "Ahb32bitWrap8WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap8WriteTest

function Ahb32bitWrap8WriteTest::new(string name = "Ahb32bitWrap8WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap8WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap8WriteSequence = AhbVirtual32bitWrap8WriteSequence::type_id::create("ahbVirtual32bitWrap8WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap8WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap8WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
