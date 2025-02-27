`ifndef AHB32BITINCR8READWITHWAITSTATETEST_INCLUDED_
`define AHB32BITINCR8READWITHWAITSTATETEST_INCLUDED_


class Ahb32bitIncr8ReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr8ReadWithWaitStateTest)
  
  AhbVirtual32bitIncr8ReadSequenceWithWaitState ahbVirtual32bitIncr8ReadSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitIncr8ReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr8ReadWithWaitStateTest

function Ahb32bitIncr8ReadWithWaitStateTest::new(string name = "Ahb32bitIncr8ReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr8ReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr8ReadSequenceWithWaitState = AhbVirtual32bitIncr8ReadSequenceWithWaitState::type_id::create("ahbVirtual32bitIncr8ReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr8ReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr8ReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
