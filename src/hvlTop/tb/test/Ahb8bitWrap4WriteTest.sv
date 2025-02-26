`ifndef AHB8BITWRAP4WRITETEST_INCLUDED_
`define AHB8BITWRAP4WRITETEST_INCLUDED_

class Ahb8bitWrap4WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitWrap4WriteTest)
  
  AhbVirtual8bitWrap4WriteSequence ahbVirtual8bitWrap4WriteSequence; 

  extern function new(string name = "Ahb8bitWrap4WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitWrap4WriteTest

function Ahb8bitWrap4WriteTest::new(string name = "Ahb8bitWrap4WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitWrap4WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitWrap4WriteSequence = AhbVirtual8bitWrap4WriteSequence::type_id::create("ahbVirtual8bitWrap4WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitWrap4WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitWrap4WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

