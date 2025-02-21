`ifndef AHB32BITINCR16WRITETEST_INCLUDED_
`define AHB32BITINCR16WRITETEST_INCLUDED_


class Ahb32bitIncr16WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr16WriteTest)
  
  AhbVirtual32bitIncr16WriteSequence ahbVirtual32bitIncr16WriteSequence; 

  extern function new(string name = "Ahb32bitIncr16WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr16WriteTest

function Ahb32bitIncr16WriteTest::new(string name = "Ahb32bitIncr16WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr16WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr16WriteSequence = AhbVirtual32bitIncr16WriteSequence::type_id::create("ahbVirtual32bitIncr16WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr16WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr16WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

