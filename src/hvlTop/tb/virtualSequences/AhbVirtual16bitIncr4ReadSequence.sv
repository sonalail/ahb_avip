`ifndef AHBVIRTUAL16BITINCR4READSEQUENCE_INCLUDED_
`define AHBVIRTUAL16BITINCR4READSEQUENCE_INCLUDED_

class AhbVirtual16bitIncr4ReadSequence extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual16bitIncr4ReadSequence)

  AhbMaster16bitIncr4ReadSequence ahbMaster16bitIncr4ReadSequence;

  AhbSlave16bitIncr4ReadSequence ahbSlave16bitIncr4ReadSequence;

  extern function new(string name ="AhbVirtual16bitIncr4ReadSequence");
  extern task body();

endclass : AhbVirtual16bitIncr4ReadSequence

function AhbVirtual16bitIncr4ReadSequence::new(string name ="AhbVirtual16bitIncr4ReadSequence");
  super.new(name);
endfunction : new

task AhbVirtual16bitIncr4ReadSequence::body();
  super.body();
  ahbMaster16bitIncr4ReadSequence = AhbMaster16bitIncr4ReadSequence::type_id::create("ahbMaster16bitIncr4ReadSequence");
  ahbSlave16bitIncr4ReadSequence  = AhbSlave16bitIncr4ReadSequence::type_id::create("ahbSlave16bitIncr4ReadSequence");
 
  fork
    ahbMaster16bitIncr4ReadSequence.start(p_sequencer.ahbMasterSequencer);
    ahbSlave16bitIncr4ReadSequence.start(p_sequencer.ahbSlaveSequencer);
  join

 endtask : body

`endif
