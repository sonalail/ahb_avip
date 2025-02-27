
`ifndef AHBVIRTUAL32BITINCR4READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITINCR4READSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitIncr4ReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr4ReadSequenceWithWaitState)

  AhbMaster32bitIncr4ReadSequenceWithWaitState ahbMaster32bitIncr4ReadSequenceWithWaitState;

  AhbSlave32bitIncr4ReadSequenceWithWaitState ahbSlave32bitIncr4ReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitIncr4ReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitIncr4ReadSequenceWithWaitState

function AhbVirtual32bitIncr4ReadSequenceWithWaitState::new(string name ="AhbVirtual32bitIncr4ReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr4ReadSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitIncr4ReadSequenceWithWaitState = AhbMaster32bitIncr4ReadSequenceWithWaitState::type_id::create("ahbMaster32bitIncr4ReadSequenceWithWaitState");
  ahbSlave32bitIncr4ReadSequenceWithWaitState = AhbSlave32bitIncr4ReadSequenceWithWaitState::type_id::create("ahbSlave32bitIncr4ReadSequenceWithWaitState");
 fork
    ahbSlave32bitIncr4ReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
    ahbMaster32bitIncr4ReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
  join
 endtask : body

`endif
