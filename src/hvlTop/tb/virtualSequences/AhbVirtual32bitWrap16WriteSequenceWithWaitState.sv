
`ifndef AHBVIRTUAL32BITWRAP16WRITESEQUENCEWITHWAITSTATE_INCLUDED_
`define AHBVIRTUAL32BITWRAP16WRITESEQUENCEWITHWAITSTATE_INCLUDED_

class AhbVirtual32bitWrap16WriteSequenceWithWaitState extends AhbVirtualBaseSequence;
  `uvm_object_utils(AhbVirtual32bitWrap16WriteSequenceWithWaitState)

  AhbMaster32bitWrap16WriteSequenceWithWaitState ahbMaster32bitWrap16WriteSequenceWithWaitState;

  AhbSlave32bitWrap16WriteSequenceWithWaitState ahbSlave32bitWrap16WriteSequenceWithWaitState;

  extern function new(string name ="AhbVirtual32bitWrap16WriteSequenceWithWaitState");
  extern task body();

endclass : AhbVirtual32bitWrap16WriteSequenceWithWaitState

function AhbVirtual32bitWrap16WriteSequenceWithWaitState::new(string name ="AhbVirtual32bitWrap16WriteSequenceWithWaitState");
  super.new(name);
endfunction : new

task AhbVirtual32bitWrap16WriteSequenceWithWaitState::body();
  super.body();
  ahbMaster32bitWrap16WriteSequenceWithWaitState = AhbMaster32bitWrap16WriteSequenceWithWaitState::type_id::create("ahbMaster32bitWrap16WriteSequenceWithWaitState");
  ahbSlave32bitWrap16WriteSequenceWithWaitState = AhbSlave32bitWrap16WriteSequenceWithWaitState::type_id::create("ahbSlave32bitWrap16WriteSequenceWithWaitState");
 fork
      ahbSlave32bitWrap16WriteSequenceWithWaitState.start(p_sequencer.ahbSlaveSequencer);
     ahbMaster32bitWrap16WriteSequenceWithWaitState.start(p_sequencer.ahbMasterSequencer);
 join
 endtask : body

`endif




