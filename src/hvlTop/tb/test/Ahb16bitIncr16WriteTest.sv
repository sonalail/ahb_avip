`ifndef AHB16BITINCR16WRITETEST_INCLUDED_
`define AHB16BITINCR16WRITETEST_INCLUDED_


class Ahb16bitIncr16WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitIncr16WriteTest)
  
  AhbVirtual16bitIncr16WriteSequence ahbVirtual16bitIncr16WriteSequence; 

  extern function new(string name = "Ahb16bitIncr16WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitIncr16WriteTest

function Ahb16bitIncr16WriteTest::new(string name = "Ahb16bitIncr16WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitIncr16WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitIncr16WriteSequence = AhbVirtual16bitIncr16WriteSequence::type_id::create("ahbVirtual16bitIncr16WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitIncr16WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitIncr16WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

