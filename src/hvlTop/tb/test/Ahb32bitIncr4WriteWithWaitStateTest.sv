`ifndef AHB32BITINCR4WRITEWITHWAITSTATETEST_INCLUDED_
`define AHB32BITINCR4WRITEWITHWAITSTATETEST_INCLUDED_


class Ahb32bitIncr4WriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr4WriteWithWaitStateTest)
  
  AhbVirtual32bitIncr4WriteSequenceWithWaitState ahbVirtual32bitIncr4WriteSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitIncr4WriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr4WriteWithWaitStateTest

function Ahb32bitIncr4WriteWithWaitStateTest::new(string name = "Ahb32bitIncr4WriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr4WriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr4WriteSequenceWithWaitState = AhbVirtual32bitIncr4WriteSequenceWithWaitState::type_id::create("ahbVirtual32bitIncr4WriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr4WriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr4WriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
