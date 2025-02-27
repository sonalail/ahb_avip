`ifndef AHBVIRTUAL32BITINCR8READSEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITINCR8READSEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitIncr8ReadSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr8ReadSequenceWithWaitState)

  AhbMaster32bitIncr8ReadSequenceWithWaitState ahbMaster32bitIncr8ReadSequenceWithWaitState;

  AhbSlave32bitIncr8ReadSequenceWithWaitState ahbSlave32bitIncr8ReadSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitIncr8ReadSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitIncr8ReadSequenceWithWaitState

function AhbVirtual32bitIncr8ReadSequenceWithWaitState::new(string name ="AhbVirtual32bitIncr8ReadSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr8ReadSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitIncr8ReadSequenceWithWaitState = AhbMaster32bitIncr8ReadSequenceWithWaitState::type_id::create("ahbMaster32bitIncr8ReadSequenceWithWaitState");
  ahbSlave32bitIncr8ReadSequenceWithWaitState = AhbSlave32bitIncr8ReadSequenceWithWaitState::type_id::create("ahbSlave32bitIncr8ReadSequenceWithWaitState");
 fork
      ahbMaster32bitIncr8ReadSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
      ahbSlave32bitIncr8ReadSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
 join

 endtask : body

`endif
