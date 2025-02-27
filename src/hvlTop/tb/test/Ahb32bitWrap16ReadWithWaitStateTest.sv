
`ifndef AHB32BITWRAP16READWITHWAITSTATETEST_INCLUDED_
`define AHB32BITWRAP16READWITHWAITSTATETEST_INCLUDED_


class Ahb32bitWrap16ReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap16ReadWithWaitStateTest)
  
  AhbVirtual32bitWrap16ReadSequenceWithWaitState ahbVirtual32bitWrap16ReadSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitWrap16ReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap16ReadWithWaitStateTest

function Ahb32bitWrap16ReadWithWaitStateTest::new(string name = "Ahb32bitWrap16ReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap16ReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap16ReadSequenceWithWaitState = AhbVirtual32bitWrap16ReadSequenceWithWaitState::type_id::create("ahbVirtual32bitWrap16ReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap16ReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap16ReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
