`ifndef AHBVIRTUAL32BITINCR16READSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITINCR16READSEQUENCE_INCLUDED_

class AhbVirtual32bitIncr16ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr16ReadSequence)

  AhbMaster32bitIncr16ReadSequence ahbMaster32bitIncr16ReadSequence;

  AhbSlave32bitIncr16ReadSequence ahbSlave32bitIncr16ReadSequence;

  extern function new(string name ="AhbVirtual32bitIncr16ReadSequence");
  extern task body();

endclass : AhbVirtual32bitIncr16ReadSequence

function AhbVirtual32bitIncr16ReadSequence::new(string name ="AhbVirtual32bitIncr16ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr16ReadSequence::body();
  super.body();
  ahbMaster32bitIncr16ReadSequence = AhbMaster32bitIncr16ReadSequence::type_id::create("ahbMaster32bitIncr16ReadSequence");
  ahbSlave32bitIncr16ReadSequence  = AhbSlave32bitIncr16ReadSequence::type_id::create("ahbSlave32bitIncr16ReadSequence");

 fork
   ahbSlave32bitIncr16ReadSequence.start(p_sequencer.ahbSlaveSequencer);
   ahbMaster32bitIncr16ReadSequence.start(p_sequencer.ahbMasterSequencer);
 join
 endtask : body

`endif
