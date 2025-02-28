

`ifndef AHB32BITWRAP4READWITHWAITSTATETEST_INCLUDED_
`define AHB32BITWRAP4READWITHWAITSTATETEST_INCLUDED_


class Ahb32bitWrap4ReadWithWaitStateTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWrap4ReadWithWaitStateTest)
  
  AhbVirtual32bitWrap4ReadSequenceWithWaitState ahbVirtual32bitWrap4ReadSequenceWithWaitState; 

  extern function new(string name = "Ahb32bitWrap4ReadWithWaitStateTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWrap4ReadWithWaitStateTest

function Ahb32bitWrap4ReadWithWaitStateTest::new(string name = "Ahb32bitWrap4ReadWithWaitStateTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWrap4ReadWithWaitStateTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitWrap4ReadSequenceWithWaitState = AhbVirtual32bitWrap4ReadSequenceWithWaitState::type_id::create("ahbVirtual32bitWrap4ReadSequenceWithWaitState");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitWrap4ReadWithWaitStateTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitWrap4ReadSequenceWithWaitState.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif
