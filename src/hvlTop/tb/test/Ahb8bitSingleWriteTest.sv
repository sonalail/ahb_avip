`ifndef AHB8BITSINGLEWRITETEST_INCLUDED_
`define AHB8BITSINGLEWRITETEST_INCLUDED_


class Ahb8bitSingleWriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitSingleWriteTest)
  
  AhbVirtual8bitSingleWriteSequence ahbVirtual8bitSingleWriteSequence; 

  extern function new(string name = "Ahb8bitSingleWriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitSingleWriteTest

function Ahb8bitSingleWriteTest::new(string name = "Ahb8bitSingleWriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitSingleWriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitSingleWriteSequence = AhbVirtual8bitSingleWriteSequence::type_id::create("ahbVirtual8bitSingleWriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitSingleWriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitSingleWriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

