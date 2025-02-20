`ifndef AHB8BITINCR4WRITETEST_INCLUDED_
`define AHB8BITINCR4WRITETEST_INCLUDED_


class Ahb8bitIncr4WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitIncr4WriteTest)
  
  AhbVirtual8bitIncr4WriteSequence ahbVirtual8bitIncr4WriteSequence; 

  extern function new(string name = "Ahb8bitIncr4WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitIncr4WriteTest

function Ahb8bitIncr4WriteTest::new(string name = "Ahb8bitIncr4WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitIncr4WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitIncr4WriteSequence = AhbVirtual8bitIncr4WriteSequence::type_id::create("ahbVirtual8bitIncr4WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitIncr4WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitIncr4WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

