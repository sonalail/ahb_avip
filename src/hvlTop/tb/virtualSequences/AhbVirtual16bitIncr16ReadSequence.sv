`ifndef AHBVIRTUAL16BITINCR16READSEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITINCR16READSEQUENCE_INCLUDED_

class AhbVirtual16bitIncr16ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitIncr16ReadSequence)

  AhbMaster16bitIncr16ReadSequence ahbMaster16bitIncr16ReadSequence;

  AhbSlave16bitIncr16ReadSequence ahbSlave16bitIncr16ReadSequence;

  extern function new(string name ="AhbVirtual16bitIncr16ReadSequence");
  extern task body();

endclass : AhbVirtual16bitIncr16ReadSequence

function AhbVirtual16bitIncr16ReadSequence::new(string name ="AhbVirtual16bitIncr16ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitIncr16ReadSequence::body();
  super.body();
  ahbMaster16bitIncr16ReadSequence = AhbMaster16bitIncr16ReadSequence::type_id::create("ahbMaster16bitIncr16ReadSequence");
  ahbSlave16bitIncr16ReadSequence  = AhbSlave16bitIncr16ReadSequence::type_id::create("ahbSlave16bitIncr16ReadSequence");
	
        fork
    	 ahbSlave16bitIncr16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
     	ahbMaster16bitIncr16ReadSequence.start(p_sequencer.ahbMasterSequencer);
	join
 endtask : body

`endif
