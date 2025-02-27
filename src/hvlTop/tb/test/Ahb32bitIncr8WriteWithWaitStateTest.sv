`ifndef AHB32BITINCR8WRITEWITHWAITSTATETEST_INCLUDED_
`define AHB32BITINCR8WRITEWITHWAITSTATETEST_INCLUDED_


class Ahb32bitIncr8WriteWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr8WriteWithWaitStateTest)
  
  AhbVirtual32bitIncr8WriteSequenceWithWaitState ahbVirtual32bitIncr8WriteSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitIncr8WriteWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr8WriteWithWaitStateTest

function Ahb32bitIncr8WriteWithWaitStateTest::new(string name = "Ahb32bitIncr8WriteWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr8WriteWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr8WriteSequenceWithWaitState = AhbVirtual32bitIncr8WriteSequenceWithWaitState::type_id::create("ahbVirtual32bitIncr8WriteSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr8WriteWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr8WriteSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
