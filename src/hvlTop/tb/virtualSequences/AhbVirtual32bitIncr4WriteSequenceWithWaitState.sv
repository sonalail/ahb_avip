`ifndef AHBVIRTUAL32BITINCR4WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITINCR4WRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitIncr4WriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitIncr4WriteSequenceWithWaitState)

  AhbMaster32bitIncr4WriteSequenceWithWaitState ahbMaster32bitIncr4WriteSequenceWithWaitState;

  AhbSlave32bitIncr4WriteSequenceWithWaitState ahbSlave32bitIncr4WriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitIncr4WriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitIncr4WriteSequenceWithWaitState

function AhbVirtual32bitIncr4WriteSequenceWithWaitState::new(string name ="AhbVirtual32bitIncr4WriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitIncr4WriteSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitIncr4WriteSequenceWithWaitState = AhbMaster32bitIncr4WriteSequenceWithWaitState::type_id::create("ahbMaster32bitIncr4WriteSequenceWithWaitState");
  ahbSlave32bitIncr4WriteSequenceWithWaitState = AhbSlave32bitIncr4WriteSequenceWithWaitState::type_id::create("ahbSlave32bitIncr4WriteSequenceWithWaitState");
 fork
      ahbSlave32bitIncr4WriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
     ahbMaster32bitIncr4WriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
 join
 endtask : body

`endif
