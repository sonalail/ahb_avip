
`ifndef AHB16BITINCR4WRITETEST_INCLUDED_
`define AHB16BITINCR4WRITETEST_INCLUDED_


class Ahb16bitIncr4WriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb16bitIncr4WriteTest)
  
  AhbVirtual16bitIncr4WriteSequence ahbVirtual16bitIncr4WriteSequence; 

  extern function new(string name = "Ahb16bitIncr4WriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb16bitIncr4WriteTest

function Ahb16bitIncr4WriteTest::new(string name = "Ahb16bitIncr4WriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb16bitIncr4WriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual16bitIncr4WriteSequence = AhbVirtual16bitIncr4WriteSequence::type_id::create("ahbVirtual16bitIncr4WriteSequence");
  `uvm_info(get_type_name(),$sformatf("Ahb16bitIncr4WriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual16bitIncr4WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

