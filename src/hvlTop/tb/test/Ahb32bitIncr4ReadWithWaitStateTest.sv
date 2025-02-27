
`ifndef AHB32BITINCR4READWITHWAITSTATETEST_INCLUDED_
`define AHB32BITINCR4READWITHWAITSTATETEST_INCLUDED_


class Ahb32bitIncr4ReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr4ReadWithWaitStateTest)
  
  AhbVirtual32bitIncr4ReadSequenceWithWaitState ahbVirtual32bitIncr4ReadSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitIncr4ReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr4ReadWithWaitStateTest

function Ahb32bitIncr4ReadWithWaitStateTest::new(string name = "Ahb32bitIncr4ReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr4ReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr4ReadSequenceWithWaitState = AhbVirtual32bitIncr4ReadSequenceWithWaitState::type_id::create("ahbVirtual32bitIncr4ReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr4ReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr4ReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
