
`ifndef AHB32BITWRAP8READWITHWAITSTATETEST_INCLUDED_
`define AHB32BITWRAP8READWITHWAITSTATETEST_INCLUDED_


class Ahb32bitWrap8ReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap8ReadWithWaitStateTest)
  
  AhbVirtual32bitWrap8ReadSequenceWithWaitState ahbVirtual32bitWrap8ReadSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitWrap8ReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap8ReadWithWaitStateTest

function Ahb32bitWrap8ReadWithWaitStateTest::new(string name = "Ahb32bitWrap8ReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap8ReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap8ReadSequenceWithWaitState = AhbVirtual32bitWrap8ReadSequenceWithWaitState::type_id::create("ahbVirtual32bitWrap8ReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap8ReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap8ReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
