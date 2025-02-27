`ifndef AHBVIRTUAL32BITINCR8WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITINCR8WRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitIncr8WriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr8WriteSequenceWithWaitState)

  AhbMaster32bitIncr8WriteSequenceWithWaitState ahbMaster32bitIncr8WriteSequenceWithWaitState;

  AhbSlave32bitIncr8WriteSequenceWithWaitState ahbSlave32bitIncr8WriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitIncr8WriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitIncr8WriteSequenceWithWaitState

function AhbVirtual32bitIncr8WriteSequenceWithWaitState::new(string name ="AhbVirtual32bitIncr8WriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr8WriteSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitIncr8WriteSequenceWithWaitState = AhbMaster32bitIncr8WriteSequenceWithWaitState::type_id::create("ahbMaster32bitIncr8WriteSequenceWithWaitState");
  ahbSlave32bitIncr8WriteSequenceWithWaitState = AhbSlave32bitIncr8WriteSequenceWithWaitState::type_id::create("ahbSlave32bitIncr8WriteSequenceWithWaitState");
 fork
      ahbMaster32bitIncr8WriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
      ahbSlave32bitIncr8WriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
  join


 endtask : body

`endif
