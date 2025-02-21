`ifndef AHB16BITINCR8WRITETEST_INCLUDED_
`define AHB16BITINCR8WRITETEST_INCLUDED_


class Ahb16bitIncr8WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitIncr8WriteTest)
  
  AhbVirtual16bitIncr8WriteSequence ahbVirtual16bitIncr8WriteSequence; 

  extern function new(string name = "Ahb16bitIncr8WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitIncr8WriteTest

function Ahb16bitIncr8WriteTest::new(string name = "Ahb16bitIncr8WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitIncr8WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitIncr8WriteSequence = AhbVirtual16bitIncr8WriteSequence::type_id::create("ahbVirtual16bitIncr8WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitIncr8WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitIncr8WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

