`ifndef AHB32BITINCR4WRITETEST_INCLUDED_
`define AHB32BITINCR4WRITETEST_INCLUDED_


class Ahb32bitIncr4WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitIncr4WriteTest)
  
  AhbVirtual32bitIncr4WriteSequence ahbVirtual32bitIncr4WriteSequence; 

  extern function new(string name = "Ahb32bitIncr4WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitIncr4WriteTest

function Ahb32bitIncr4WriteTest::new(string name = "Ahb32bitIncr4WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitIncr4WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitIncr4WriteSequence = AhbVirtual32bitIncr4WriteSequence::type_id::create("ahbVirtual32bitIncr4WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb32bitIncr4WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitIncr4WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

