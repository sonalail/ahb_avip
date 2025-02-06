`ifndef AHB32BITSINGLEWRITETEST_INCLUDED_
`define AHB32BITSINGLEWRITETEST_INCLUDED_


class Ahb32bitSingleWriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitSingleWriteTest)
  
  AhbVirtual32bitSingleWriteSequence ahbVirtual32bitSingleWriteSequence; 

  extern function new(string name = "Ahb32bitSingleWriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitSingleWriteTest

function Ahb32bitSingleWriteTest::new(string name = "Ahb32bitSingleWriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitSingleWriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitSingleWriteSequence = AhbVirtual32bitSingleWriteSequence::type_id::create("ahbVirtual32bitSingleWriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitSingleWriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitSingleWriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

