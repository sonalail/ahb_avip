`ifndef AHBVIRTUAL32BITINCR16READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITINCR16READSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitIncr16ReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr16ReadSequenceWithWaitState)

  AhbMaster32bitIncr16ReadSequenceWithWaitState ahbMaster32bitIncr16ReadSequenceWithWaitState;

  AhbSlave32bitIncr16ReadSequenceWithWaitState ahbSlave32bitIncr16ReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitIncr16ReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitIncr16ReadSequenceWithWaitState

function AhbVirtual32bitIncr16ReadSequenceWithWaitState::new(string name ="AhbVirtual32bitIncr16ReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr16ReadSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitIncr16ReadSequenceWithWaitState = AhbMaster32bitIncr16ReadSequenceWithWaitState::type_id::create("ahbMaster32bitIncr16ReadSequenceWithWaitState");
  ahbSlave32bitIncr16ReadSequenceWithWaitState = AhbSlave32bitIncr16ReadSequenceWithWaitState::type_id::create("ahbSlave32bitIncr16ReadSequenceWithWaitState");
 fork
    ahbMaster32bitIncr16ReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
    ahbSlave32bitIncr16ReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
 join


 endtask : body

`endif
