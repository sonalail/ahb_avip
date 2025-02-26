`ifndef AHB8BITINCR16READTEST_INCLUDED_
`define AHB8BITINCR16READTEST_INCLUDED_


class Ahb8bitIncr16ReadTest extends AhbBaseTest;
  `uvm_component_utils(Ahb8bitIncr16ReadTest)
  
  AhbVirtual8bitIncr16ReadSequence ahbVirtual8bitIncr16ReadSequence; 

  extern function new(string name = "Ahb8bitIncr16ReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb8bitIncr16ReadTest

function Ahb8bitIncr16ReadTest::new(string name = "Ahb8bitIncr16ReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb8bitIncr16ReadTest::run_phase(uvm_phase phase);
  
  ahbVirtual8bitIncr16ReadSequence = AhbVirtual8bitIncr16ReadSequence::type_id::create("ahbVirtual8bitIncr16ReadSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb8bitIncr16ReadTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual8bitIncr16ReadSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

