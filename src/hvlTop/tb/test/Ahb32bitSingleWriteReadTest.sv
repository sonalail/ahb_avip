`ifndef AHB32BITSINGLEWRITEREADTEST_INCLUDED_
`define AHB32BITSINGLEWRITEREADTEST_INCLUDED_


class Ahb32bitSingleWriteReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitSingleWriteReadTest)
  
  AhbVirtual32bitSingleWriteReadSequence ahbVirtual32bitSingleWriteReadSequence; 

  extern function new(string name = "Ahb32bitSingleWriteReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitSingleWriteReadTest

function Ahb32bitSingleWriteReadTest::new(string name = "Ahb32bitSingleWriteReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitSingleWriteReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitSingleWriteReadSequence = AhbVirtual32bitSingleWriteReadSequence::type_id::create("ahbVirtual32bitSingleWriteReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitSingleWriteReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitSingleWriteReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

