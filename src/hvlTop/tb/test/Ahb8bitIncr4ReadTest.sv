`ifndef AHB8BITINCR4READTEST_INCLUDED_
`define AHB8BITINCR4READTEST_INCLUDED_


class Ahb8bitIncr4ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitIncr4ReadTest)
  
  AhbVirtual8bitIncr4ReadSequence ahbVirtual8bitIncr4ReadSequence; 

  extern function new(string name = "Ahb8bitIncr4ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitIncr4ReadTest

function Ahb8bitIncr4ReadTest::new(string name = "Ahb8bitIncr4ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitIncr4ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitIncr4ReadSequence = AhbVirtual8bitIncr4ReadSequence::type_id::create("ahbVirtual8bitIncr4ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitIncr4ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitIncr4ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

