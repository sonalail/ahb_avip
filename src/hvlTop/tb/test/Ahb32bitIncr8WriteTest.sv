`ifndef AHB32BITINCR8WRITETEST_INCLUDED_
`define AHB32BITINCR8WRITETEST_INCLUDED_


class Ahb32bitIncr8WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr8WriteTest)
  
  AhbVirtual32bitIncr8WriteSequence ahbVirtual32bitIncr8WriteSequence; 

  extern function new(string name = "Ahb32bitIncr8WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr8WriteTest

function Ahb32bitIncr8WriteTest::new(string name = "Ahb32bitIncr8WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr8WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr8WriteSequence = AhbVirtual32bitIncr8WriteSequence::type_id::create("ahbVirtual32bitIncr8WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr8WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr8WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

