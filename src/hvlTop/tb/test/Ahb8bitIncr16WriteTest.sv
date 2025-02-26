`ifndef AHB8BITINCR16WRITETEST_INCLUDED_
`define AHB8BITINCR16WRITETEST_INCLUDED_


class Ahb8bitIncr16WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitIncr16WriteTest)
  
  AhbVirtual8bitIncr16WriteSequence ahbVirtual8bitIncr16WriteSequence; 

  extern function new(string name = "Ahb8bitIncr16WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitIncr16WriteTest

function Ahb8bitIncr16WriteTest::new(string name = "Ahb8bitIncr16WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitIncr16WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitIncr16WriteSequence = AhbVirtual8bitIncr16WriteSequence::type_id::create("ahbVirtual8bitIncr16WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitIncr16WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitIncr16WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

