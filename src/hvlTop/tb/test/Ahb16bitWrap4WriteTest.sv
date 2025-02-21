`ifndef AHB16BITWRAP4WRITETEST_INCLUDED_
`define AHB16BITWRAP4WRITETEST_INCLUDED_

class Ahb16bitWrap4WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitWrap4WriteTest)
  
  AhbVirtual16bitWrap4WriteSequence ahbVirtual16bitWrap4WriteSequence; 

  extern function new(string name = "Ahb16bitWrap4WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitWrap4WriteTest

function Ahb16bitWrap4WriteTest::new(string name = "Ahb16bitWrap4WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitWrap4WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitWrap4WriteSequence = AhbVirtual16bitWrap4WriteSequence::type_id::create("ahbVirtual16bitWrap4WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitWrap4WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitWrap4WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

