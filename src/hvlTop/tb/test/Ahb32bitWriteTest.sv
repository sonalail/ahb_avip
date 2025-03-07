`ifndef AHB32BITWRITETEST_INCLUDED_
`define AHB32BITWRITETEST_INCLUDED_

class Ahb32bitWriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWriteTest)
  
  AhbVirtual32bitSingleWriteSequence ahbVirtual32bitSingleWriteSequence; 
 
extern function new(string name = "Ahb32bitWriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWriteTest

function Ahb32bitWriteTest::new(string name = "Ahb32bitWriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitSingleWriteSequence = AhbVirtual32bitSingleWriteSequence::type_id::create("ahbVirtual32bitSingleWriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitSingleWriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

