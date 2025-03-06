`ifndef AHB32BITWRITETEST_INCLUDED_
`define AHB32BITWRITETEST_INCLUDED_


class Ahb32bitWriteTest extends AhbBaseTest;
  `uvm_component_utils(Ahb32bitWriteTest)
  
  AhbVirtual32bitSingleWriteSequence ahbVirtual32bitSingleWriteSequence; 
/*  AhbVirtual32bitIncr4WriteSequence ahbVirtual32bitIncr4WriteSequence; 
  AhbVirtual32bitWrap4WriteSequence ahbVirtual32bitWrap4WriteSequence; 
  AhbVirtual32bitIncr8WriteSequence ahbVirtual32bitIncr8WriteSequence; 
  AhbVirtual32bitWrap8WriteSequence ahbVirtual32bitWrap8WriteSequence; 
  AhbVirtual32bitIncr16WriteSequence ahbVirtual32bitIncr16WriteSequence; 
  AhbVirtual32bitWrap16WriteSequence ahbVirtual32bitWrap16WriteSequence; 
*/  
extern function new(string name = "Ahb32bitWriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Ahb32bitWriteTest

function Ahb32bitWriteTest::new(string name = "Ahb32bitWriteTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new


task Ahb32bitWriteTest::run_phase(uvm_phase phase);
  
  ahbVirtual32bitSingleWriteSequence = AhbVirtual32bitSingleWriteSequence::type_id::create("ahbVirtual32bitSingleWriteSequence");
 /* ahbVirtual32bitIncr4WriteSequence = AhbVirtual32bitIncr4WriteSequence::type_id::create("ahbVirtual32bitIncr4WriteSequence");
  ahbVirtual32bitWrap4WriteSequence = AhbVirtual32bitWrap4WriteSequence::type_id::create("ahbVirtual32bitWrap4WriteSequence");
  ahbVirtual32bitIncr8WriteSequence = AhbVirtual32bitIncr8WriteSequence::type_id::create("ahbVirtual32bitIncr8WriteSequence");
  ahbVirtual32bitWrap8WriteSequence = AhbVirtual32bitWrap8WriteSequence::type_id::create("ahbVirtual32bitWrap8WriteSequence");
  ahbVirtual32bitIncr16WriteSequence = AhbVirtual32bitIncr16WriteSequence::type_id::create("ahbVirtual32bitIncr16WriteSequence");
  ahbVirtual32bitWrap16WriteSequence = AhbVirtual32bitWrap16WriteSequence::type_id::create("ahbVirtual32bitWrap16WriteSequence");
  */
`uvm_info(get_type_name(),$sformatf("Ahb32bitWriteTest"),UVM_LOW);
  phase.raise_objection(this);
    ahbVirtual32bitSingleWriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
   // ahbVirtual32bitIncr4WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
   // ahbVirtual32bitWrap4WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
   // ahbVirtual32bitIncr8WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
   // ahbVirtual32bitWrap8WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
   // ahbVirtual32bitIncr16WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
   // ahbVirtual32bitWrap16WriteSequence.start(ahbEnvironment.ahbVirtualSequencer);
	#10;
  phase.drop_objection(this);

endtask : run_phase

`endif

