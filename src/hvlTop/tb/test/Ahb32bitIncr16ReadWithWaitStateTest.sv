`ifndef AHB32BITINCR16READWITHWAITSTATETEST_INCLUDED_
`define AHB32BITINCR16READWITHWAITSTATETEST_INCLUDED_


class Ahb32bitIncr16ReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr16ReadWithWaitStateTest)
  
  AhbVirtual32bitIncr16ReadSequenceWithWaitState ahbVirtual32bitIncr16ReadSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitIncr16ReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr16ReadWithWaitStateTest

function Ahb32bitIncr16ReadWithWaitStateTest::new(string name = "Ahb32bitIncr16ReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr16ReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr16ReadSequenceWithWaitState = AhbVirtual32bitIncr16ReadSequenceWithWaitState::type_id::create("ahbVirtual32bitIncr16ReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr16ReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr16ReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
