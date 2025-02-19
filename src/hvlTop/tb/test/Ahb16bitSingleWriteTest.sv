`ifndef AHB16BITSINGLEWRITETEST_INCLUDED_
`define AHB16BITSINGLEWRITETEST_INCLUDED_


class Ahb16bitSingleWriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitSingleWriteTest)
  
  AhbVirtual16bitSingleWriteSequence ahbVirtual16bitSingleWriteSequence; 

  extern function new(string name = "Ahb16bitSingleWriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitSingleWriteTest

function Ahb16bitSingleWriteTest::new(string name = "Ahb16bitSingleWriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitSingleWriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitSingleWriteSequence = AhbVirtual16bitSingleWriteSequence::type_id::create("ahbVirtual16bitSingleWriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitSingleWriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitSingleWriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

