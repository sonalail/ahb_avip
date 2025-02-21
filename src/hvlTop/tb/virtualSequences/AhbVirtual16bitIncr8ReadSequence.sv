`ifndef AHBVIRTUAL16BITINCR8READSEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITINCR8READSEQUENCE_INCLUDED_

class AhbVirtual16bitIncr8ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitIncr8ReadSequence)

  AhbMaster16bitIncr8ReadSequence ahbMaster16bitIncr8ReadSequence;

  AhbSlave16bitIncr8ReadSequence ahbSlave16bitIncr8ReadSequence;

  extern function new(string name ="AhbVirtual16bitIncr8ReadSequence");
  extern task body();

endclass : AhbVirtual16bitIncr8ReadSequence

function AhbVirtual16bitIncr8ReadSequence::new(string name ="AhbVirtual16bitIncr8ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitIncr8ReadSequence::body();
  super.body();
  ahbMaster16bitIncr8ReadSequence = AhbMaster16bitIncr8ReadSequence::type_id::create("ahbMaster16bitIncr8ReadSequence");
  ahbSlave16bitIncr8ReadSequence  = AhbSlave16bitIncr8ReadSequence::type_id::create("ahbSlave16bitIncr8ReadSequence");
	
        fork
    	 ahbSlave16bitIncr8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
     	ahbMaster16bitIncr8ReadSequence.start(p_sequencer.ahbMasterSequencer);
	join
 endtask : body

`endif
