`ifndef AHBVIRTUAL32BITINCR16WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITINCR16WRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitIncr16WriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr16WriteSequenceWithWaitState)

  AhbMaster32bitIncr16WriteSequenceWithWaitState ahbMaster32bitIncr16WriteSequenceWithWaitState;

  AhbSlave32bitIncr16WriteSequenceWithWaitState ahbSlave32bitIncr16WriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitIncr16WriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitIncr16WriteSequenceWithWaitState

function AhbVirtual32bitIncr16WriteSequenceWithWaitState::new(string name ="AhbVirtual32bitIncr16WriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr16WriteSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitIncr16WriteSequenceWithWaitState = AhbMaster32bitIncr16WriteSequenceWithWaitState::type_id::create("ahbMaster32bitIncr16WriteSequenceWithWaitState");
  ahbSlave32bitIncr16WriteSequenceWithWaitState = AhbSlave32bitIncr16WriteSequenceWithWaitState::type_id::create("ahbSlave32bitIncr16WriteSequenceWithWaitState");

 fork
      ahbMaster32bitIncr16WriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
      ahbSlave32bitIncr16WriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
  join


 endtask : body

`endif
