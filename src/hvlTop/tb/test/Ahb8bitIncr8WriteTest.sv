`ifndef AHB8BITINCR8WRITETEST_INCLUDED_
`define AHB8BITINCR8WRITETEST_INCLUDED_


class Ahb8bitIncr8WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitIncr8WriteTest)
  
  AhbVirtual8bitIncr8WriteSequence ahbVirtual8bitIncr8WriteSequence; 

  extern function new(string name = "Ahb8bitIncr8WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitIncr8WriteTest

function Ahb8bitIncr8WriteTest::new(string name = "Ahb8bitIncr8WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitIncr8WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitIncr8WriteSequence = AhbVirtual8bitIncr8WriteSequence::type_id::create("ahbVirtual8bitIncr8WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitIncr8WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitIncr8WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

