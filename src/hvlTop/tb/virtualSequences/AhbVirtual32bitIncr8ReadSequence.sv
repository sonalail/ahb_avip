`ifndef AHBVIRTUAL32BITINCR8READSEQUENCE_INCLUDED_
`define AHBVIRTUAL32BITINCR8READSEQUENCE_INCLUDED_

class AhbVirtual32bitIncr8ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr8ReadSequence)

  AhbMaster32bitIncr8ReadSequence ahbMaster32bitIncr8ReadSequence;

  AhbSlave32bitIncr8ReadSequence ahbSlave32bitIncr8ReadSequence;

  extern function new(string name ="AhbVirtual32bitIncr8ReadSequence");
  extern task body();

endclass : AhbVirtual32bitIncr8ReadSequence

function AhbVirtual32bitIncr8ReadSequence::new(string name ="AhbVirtual32bitIncr8ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr8ReadSequence::body();
  super.body();
  ahbMaster32bitIncr8ReadSequence = AhbMaster32bitIncr8ReadSequence::type_id::create("ahbMaster32bitIncr8ReadSequence");
  ahbSlave32bitIncr8ReadSequence  = AhbSlave32bitIncr8ReadSequence::type_id::create("ahbSlave32bitIncr8ReadSequence");

 fork
   ahbSlave32bitIncr8ReadSequence.start(p_sequencer.ahbSlaveSequencer);
   ahbMaster32bitIncr8ReadSequence.start(p_sequencer.ahbMasterSequencer);
 join
 endtask : body

`endif
